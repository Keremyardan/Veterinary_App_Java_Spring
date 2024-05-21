package com.dev_patika.veterinaryapp.api;

import com.dev_patika.veterinaryapp.business.abstracts.IAnimalService;
import com.dev_patika.veterinaryapp.business.abstracts.ICustomerService;
import com.dev_patika.veterinaryapp.core.config.result.ResultData;
import com.dev_patika.veterinaryapp.core.config.utilities.ResultHelper;
import com.dev_patika.veterinaryapp.core.modelMapper.IModelMapperService;
import com.dev_patika.veterinaryapp.dto.request.animal.AnimalSaveRequest;
import com.dev_patika.veterinaryapp.dto.response.animal.AnimalResponse;
import com.dev_patika.veterinaryapp.entities.Animal;
import com.dev_patika.veterinaryapp.entities.Customer;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping("/v1/animals")
public class AnimalController {
    private final IAnimalService animalService;
    private final IModelMapperService modelMapper;

    private final ICustomerService customerService;


    public AnimalController(IAnimalService animalService, IModelMapperService modelMapper, ICustomerService customerService) {
        this.animalService = animalService;
        this.modelMapper = modelMapper;
        this.customerService = customerService;
    }

    @PostMapping("/animal")
    @ResponseStatus(HttpStatus.CREATED)
    public ResultData<AnimalResponse> save(@Valid @RequestBody AnimalSaveRequest animalSaveRequest) {
        // This method saves the animal.
        Animal saveAnimal = this.modelMapper.forRequest().map(animalSaveRequest, Animal.class);

        Customer customer = this.customerService.get(animalSaveRequest.getCustomerId());
        saveAnimal.setCustomer(customer);

        this.animalService.saveAnimal(saveAnimal);
        return ResultHelper.created(this.modelMapper.forResponse().map(saveAnimal, AnimalResponse.class));
    }

    @PutMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public ResultData<AnimalResponse> update(@PathVariable("id") Long id, @Valid @RequestBody AnimalSaveRequest animalSaveRequest) {
        Animal animal = this.modelMapper.forRequest().map(animalSaveRequest, Animal.class);

        Animal updatedAnimal = this.animalService.update(id,animal);

        return ResultHelper.success(this.modelMapper.forRequest().map(updatedAnimal,AnimalResponse.class));
    }

    @GetMapping("/animal/{id}")
    @ResponseStatus(HttpStatus.OK)
    public ResultData<AnimalResponse> findAnimalById(@PathVariable("id") Long id) {
        Animal animal = this.animalService.getById(id);
        return ResultHelper.success(this.modelMapper.forRequest().map(animal, AnimalResponse.class));
    }
    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteAnimalById(@PathVariable("id") Long id) {
        this.animalService.delete(id);
    }
}
