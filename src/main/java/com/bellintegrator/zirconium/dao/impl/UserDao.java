package com.bellintegrator.zirconium.dao.impl;

import com.bellintegrator.zirconium.dao.*;
import com.bellintegrator.zirconium.exception.EntityNotFoundException;
import com.bellintegrator.zirconium.model.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@Repository
@Slf4j
public class UserDao implements ContentDao<User> {
    private final UserRepository userRepository;
    private final OfficeRepository officeRepository;
    private final DocumentTypeRepository documentTypeRepository;
    private final CountryRepository countryRepository;
    private final EntityManager entityManager;

    @Autowired
    public UserDao(UserRepository userRepository,
                   OfficeRepository officeRepository,
                   DocumentTypeRepository documentTypeRepository,
                   CountryRepository countryRepository,
                   EntityManager entityManager) {
        this.userRepository = userRepository;
        this.officeRepository = officeRepository;
        this.documentTypeRepository = documentTypeRepository;
        this.countryRepository = countryRepository;
        this.entityManager = entityManager;
    }

    @Override
    public List<User> findAll(User user) {
        if (user == null) {
            throw new IllegalArgumentException("User can not be null");
        }

//        UserSpecification userSpec = new UserSpecification(user);
//        return userRepository.findAll(userSpec);
        return userRepository.findAll();
    }

    @Override
    public User findById(long id) {
        Optional<User> container = userRepository.findById(id);
        if (!container.isPresent()) {
            throw new EntityNotFoundException("user id " + id + " not found");
        }

        log.debug("GETTING: " + container.get().toString());

        return container.get();
    }

    @Override
    public long save(User user) {
        if (user == null) {
            throw new IllegalArgumentException("User can not be null");
        }

        log.debug("SAVING: " + user.toString());

        Long officeId = user.getOfficeId();

        if (!officeRepository.existsById(officeId)) {
            throw new EntityNotFoundException("office id " + officeId + " not found");
        }

        Country country = validateCountry(user.getCountry());
        user.setCountry(country);

        Document document = user.getDocument();

        if (document != null) {
            DocumentType documentType = validateDocumentType(document.getDocumentType());
            document.setDocumentType(documentType);
        }

        user.setDocument(null);
        userRepository.save(user);

        if (document != null) {
            document.setUserId(user.getId());
            user.setDocument(document);
        }

        return user.getId();
    }

    @Override
    public void update(User user) {
        if (user == null) {
            return;
        }

        log.debug("UPDATING: " + user.toString());

        long userId = user.getId();
        Optional<User> container = userRepository.findById(userId);
        if (!container.isPresent()) {
            throw new EntityNotFoundException("can't update: user id " + userId + " not found");
        }

        User currentUser = container.get();

        if (user.getOfficeId() != null) {
            currentUser.setOfficeId(user.getOfficeId());
        }

        if (user.getFirstName() != null) {
            currentUser.setFirstName(user.getFirstName());
        }

        if (user.getSecondName() != null) {
            currentUser.setSecondName(user.getSecondName());
        }

        if (user.getMiddleName() != null) {
            currentUser.setMiddleName(user.getMiddleName());
        }

        if (user.getPosition() != null) {
            currentUser.setPosition(user.getPosition());
        }

        Document document = user.getDocument();
        Document currentDocument = currentUser.getDocument();
        if (document != null) {

            DocumentType documentType = validateDocumentType(document.getDocumentType());
            if (documentType != null) {
                currentDocument.setDocumentType(documentType);
            }

            if (document.getIsIdentified() != null) {
                currentDocument.setIsIdentified(document.getIsIdentified());
            }

            if (document.getDocDate() != null) {
                currentDocument.setDocDate(document.getDocDate());
            }

            if (document.getDocNumber() != null) {
                currentDocument.setDocNumber(document.getDocNumber());
            }
        }

        Country country = validateCountry(user.getCountry());
        if (country != null) {
            currentUser.setCountry(country);
        }

        Set<Phone> oldPhones = new HashSet<>(currentUser.getPhones());

        if (user.getPhones() != null) {
            currentUser.setPhones(user.getPhones());
        }

        userRepository.saveAndFlush(currentUser);

        Query query = entityManager.createNativeQuery(CustomQueries.DELETE_UNUSED_PHONES);
        for (Phone phone : oldPhones) {
            query.setParameter("id", phone.getId());
        }
        query.executeUpdate();
    }

    private Country validateCountry(Country country) {
        if (country == null || country.getCode() == null) {
            return null;
        }

        String countryCode = country.getCode();
        Country countryFromRepository = countryRepository.findByCode(countryCode);

        if (countryFromRepository == null) {
            throw new EntityNotFoundException("Illegal country code: " + countryCode);
        }

        return countryFromRepository;
    }

    private DocumentType validateDocumentType(DocumentType docType) {
        if (docType == null || docType.getCode() == null) {
            return null;
        }

        String docCode = docType.getCode();
        DocumentType docTypeFromRepository = documentTypeRepository.findByCode(docCode);

        if (docTypeFromRepository == null) {
            throw new EntityNotFoundException("Illegal document code: " + docCode);
        }

        return docTypeFromRepository;
    }
}
