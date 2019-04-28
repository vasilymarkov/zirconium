package com.bellintegrator.zirconium;

import com.bellintegrator.zirconium.controller.Controller;
import com.bellintegrator.zirconium.service.ViewService;
import com.google.gson.Gson;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.mockito.*;
import org.mockito.junit.MockitoJUnitRunner;

import static com.bellintegrator.zirconium.ControllerTests.*;
import static com.bellintegrator.zirconium.controller.SuccessResponseBody.*;
import static junit.framework.TestCase.*;
import static org.mockito.Mockito.*;

@RunWith(MockitoJUnitRunner.class)
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class ControllerMockTests {

    private Gson gson = new Gson();

    @Mock
    private ViewService srv;

    @InjectMocks
    private Controller ctrl;

    // Сохранение офиса
    @Test
    public void mockTestAddOffice() {
        when(srv.save("office", office)).thenReturn(1L);

        // Ошибка: вызов ctrl.save(office) приводит к
        // IllegalStateException: No current ServletRequestAttributes
        assertEquals(gson.toJson(ctrl.save("office", office).getBody()), gson.toJson(SUCCESS_RESPONSE_BODY));
    }

    // Запрос данных об офисе id
    @Test
    public void mockTestGetOffice() {
        when(srv.get("office", 1L)).thenReturn(office);

        assertEquals(gson.toJson(ctrl.get("office", 1L)), gson.toJson(office));
    }
}