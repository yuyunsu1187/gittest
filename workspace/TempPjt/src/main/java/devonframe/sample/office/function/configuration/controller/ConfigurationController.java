package devonframe.sample.office.function.configuration.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import devonframe.configuration.ConfigService;
import devonframe.sample.office.function.configuration.model.ConfigurationValues;
import devonframe.sample.office.function.configuration.model.PropertiesCode;

@Controller
public class ConfigurationController {

    @Resource(name = "propertiesService")
    private ConfigService propertiesService;

    @Resource(name = "xmlService")
    private ConfigService xmlService;

    @Resource(name = "configurationService")
    private ConfigService configurationService;

    private final String propertyKeyXml = "Xml";

    private final String propertyKeyProperties = "Properties";

    private final String propertyKeyComposite = "Composite";

    @RequestMapping(value = "/function/configuration/employeeForm.do")
    public String employeeForm(ModelMap model) {

        ConfigurationValues configurationValues = new ConfigurationValues();

        model.addAttribute("codeList", retrieveCodeList());


        model.addAttribute("propertiesCodeList", retrievePropertiesCodeList());
        model.addAttribute("xmlCodeList", retrieveXmlCodeList());
        model.addAttribute("configuration", configurationValues);

        return "function/configuration/employeeForm";
    }

    @RequestMapping(value = "/function/configuration/retrieveConfiguraion.do")
    public String retrieveConfiguraion(ConfigurationValues configurationValues, ModelMap model) {

        String propertyKey = configurationValues.getPropertyKey();
        String searchKey = configurationValues.getSearchKey();

        if (propertyKey != null) {

            if (propertyKeyXml.equalsIgnoreCase(propertyKey)) {

                configurationValues.setPropertyValue(xmlService.getString(searchKey));
            } else if (propertyKeyProperties.equalsIgnoreCase(propertyKey)) {

                configurationValues.setPropertyValue(propertiesService.getString(searchKey));
            } else if (propertyKeyComposite.equalsIgnoreCase(propertyKey)) {

                configurationValues.setPropertyValue(configurationService.getString(searchKey));
            }
        }

   
        model.addAttribute("codeList", retrieveCodeList());
        model.addAttribute("propertiesCodeList", retrievePropertiesCodeList());
        model.addAttribute("xmlCodeList", retrieveXmlCodeList());
        model.addAttribute("configuration", configurationValues);
   

        return "function/configuration/employeeForm";
    }

    private List<PropertiesCode> retrieveCodeList() {

        List<PropertiesCode> propertiesCodeList = new ArrayList<PropertiesCode>();

        PropertiesCode propertiesCodeProperties = new PropertiesCode();
        propertiesCodeProperties.setKey(propertyKeyProperties);
        propertiesCodeProperties.setValue(propertyKeyProperties);
        propertiesCodeList.add(propertiesCodeProperties);

        PropertiesCode propertiesCodeXml = new PropertiesCode();
        propertiesCodeXml.setKey(propertyKeyXml);
        propertiesCodeXml.setValue(propertyKeyXml);
        propertiesCodeList.add(propertiesCodeXml);

        PropertiesCode propertiesComposite = new PropertiesCode();
        propertiesComposite.setKey(propertyKeyComposite);
        propertiesComposite.setValue(propertyKeyComposite);
        propertiesCodeList.add(propertiesComposite);

        return propertiesCodeList;

    }


    private List<PropertiesCode> retrieveXmlCodeList() {

        List<PropertiesCode> xmlCodeList = new ArrayList<PropertiesCode>();

        List<String> keys = xmlService.getKeys();

        for (int i = 0; i < keys.size(); i++) {

            String key = keys.get(i);
            PropertiesCode propertiesCode = new PropertiesCode();
            propertiesCode.setKey(key);
            propertiesCode.setValue(xmlService.getString(key));
            xmlCodeList.add(propertiesCode);
        }

        return xmlCodeList;
    }

    private List<PropertiesCode> retrievePropertiesCodeList() {

        List<PropertiesCode> propertiesCodeList = new ArrayList<PropertiesCode>();

        List<String> keys = propertiesService.getKeys();

        for (int i = 0; i < keys.size(); i++) {

            String key = keys.get(i);
            PropertiesCode propertiesCode = new PropertiesCode();
            propertiesCode.setKey(key);
            propertiesCode.setValue(propertiesService.getString(key));
            propertiesCodeList.add(propertiesCode);
        }

        return propertiesCodeList;
    }

}
