package com.searchmytraining.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.searchmytraining.dto.TraineeDTO;

public class TraineeValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return TraineeDTO.class.equals(clazz);		
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		/*TraineeDTO traineedto = (TraineeDTO) target;
		
		ValidationUtils.rejectIfEmpty(errors, "traineetype", "value.required","Null Not allowed.");
		ValidationUtils.rejectIfEmpty(errors, "corporatename", "value.required","Null Not allowed.");
		ValidationUtils.rejectIfEmpty(errors, "name", "value.required","Null Not allowed.");
		ValidationUtils.rejectIfEmpty(errors, "contact", "value.required","Null Not allowed.");
		ValidationUtils.rejectIfEmpty(errors, "email", "value.required","Null Not allowed.");
		ValidationUtils.rejectIfEmpty(errors, "password", "value.required","Null Not allowed.");
		
		
		if(traineedto.getName().length()<6 ||traineedto.getName().length()>50)
		{
			errors.rejectValue("name", "name.invalid",new Object[] {traineedto.getName()},"Name length sould be between 6 and 50");
			System.err.println("Name length sould be between 6 and 50");
		}
		*/

	}

}
