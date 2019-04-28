package com.bellintegrator.zirconium.service;

import com.bellintegrator.zirconium.exception.EntityNotFoundException;
import com.bellintegrator.zirconium.view.OfficeView;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.*;
import java.util.concurrent.atomic.AtomicLong;

/**
 * Сервис для работы с mock-объектами офисов
 */
@Service
public class ViewServiceImpl implements ViewService {

    private final Map<Long, Object> views = new HashMap<>();
    private final AtomicLong counter = new AtomicLong();

    private final ObjectMapper objectMapper;

    @Autowired
    public ViewServiceImpl(ObjectMapper mapper) {
        this.objectMapper = mapper;
        OfficeView view = new OfficeView(
                1,
                1,
                "Исследовательский центр",
                "г. Москва, ул. Вербная, д. 5",
                Arrays.asList("74957870544", "74957870545"),
                true
        );

        save("office", view);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @Transactional
    public Collection<?> list(String viewName, Object view) {
        view = deserialize(view);
        return views.values(); // переменная view пока не использутся
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @Transactional
    public Object get(String viewName, long id) {
        Object view = views.get(id);
        if (view == null) {
            throw new EntityNotFoundException("office id " + id + " not found");
        }
        return views.get(id);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @Transactional
    public void update(String viewName, Object view) {
        view = deserialize(view);
        long id = ((OfficeView) view).getId();
        if (!views.containsKey(id)) {
            throw new EntityNotFoundException("can't update: office id " + id + " not found");
        }
        views.put(id, view);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @Transactional
    public long save(String viewName, Object view) {
        view = deserialize(view);
        long id = counter.incrementAndGet();
        ((OfficeView) view).setId(id);
        views.putIfAbsent(id, view);
        return id;
    }

    private Object deserialize(Object json) {
        return objectMapper.convertValue(json, OfficeView.class);
    }
}
