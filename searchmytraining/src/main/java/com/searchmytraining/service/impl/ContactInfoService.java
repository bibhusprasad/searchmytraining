package com.searchmytraining.service.impl;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.dozer.DozerBeanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import com.searchmytraining.dao.IContactInfoDAO;
import com.searchmytraining.dao.IPhoneDAO;
import com.searchmytraining.dao.IPhoneTypeDAO;
import com.searchmytraining.dto.ContactDTO;
import com.searchmytraining.entity.ContactInfoEntity;
import com.searchmytraining.entity.PhoneEntity;
import com.searchmytraining.entity.PhoneTypeEntity;
import com.searchmytraining.entity.UserEntity;
import com.searchmytraining.service.IContactInfoService;
import com.searchmytraining.service.IUserService;

@Repository
public class ContactInfoService implements IContactInfoService {

	@Autowired
	private WebApplicationContext context;
	@Autowired
	private DozerBeanMapper mapper;
	@Autowired
	private IUserService userservice;
	@Autowired
	private IPhoneTypeDAO phonetypedao;
	@Autowired
	private IPhoneDAO phonedao;
	@Autowired
	private IContactInfoDAO contactdao;
	@Override
	@Transactional
	public void updateContactInfoDet(ContactDTO contactdto) {
		ContactInfoEntity contactentity = mapper.map(contactdto, ContactInfoEntity.class);
		UserEntity user = userservice.getUser(contactdto.getUserid());
		ArrayList<Integer> phonetypeids = contactdto.getPhonetypeid();
		ArrayList<String> phones = contactdto.getPhone();
		Iterator<Integer> phonetypeitr = phonetypeids.iterator();
		Iterator<String> phoneitr = phones.iterator();
		List<PhoneEntity> phonesdet = phonedao.getPhoneByUserId(contactdto.getUserid().longValue());
		
		if(phonesdet!=null)
		{
			Iterator<PhoneEntity> phonedetitr = phonesdet.iterator();
			while(phonetypeitr.hasNext() && phoneitr.hasNext())
			{
				if(phonedetitr.hasNext())
				{
					String phonevalue = phoneitr.next();
					Integer phonetypeid = phonetypeitr.next();
					PhoneEntity phoneentity = phonedetitr.next();
					phoneentity.setPhoneValue(phonevalue);
					if(phoneentity.getPhonetype()==null || phoneentity.getPhonetype().getPhnTypeId() != phonetypeid)
					{
						PhoneTypeEntity phonetypeentity = phonetypedao.getPhoneType(phonetypeid);
						phoneentity.setPhonetype(phonetypeentity);
					}
					phonedao.updatePhoneDetails(phoneentity);
				}
				else
				{
					PhoneEntity phone_new = (PhoneEntity)context.getBean("phoneEntity");
					String phonevalue = phoneitr.next();
					Integer phonetypeid = phonetypeitr.next();
					phone_new.setPhoneValue(phonevalue);
					PhoneTypeEntity phonetypeentity = phonetypedao.getPhoneType(phonetypeid);
					phone_new.setPhonetype(phonetypeentity);
					phone_new.setUser(user);
					phonedao.insertPhoneDetails(phone_new);
				}
			}
		}
		contactentity.setUser(user);
		contactdao.insertContactInfo(contactentity);
	}
	@Override
	public ContactInfoEntity getContactInfoDetailsByUserId(Long userid) {
		return contactdao.getContactInfoDetails(userid);
	}
	
}
