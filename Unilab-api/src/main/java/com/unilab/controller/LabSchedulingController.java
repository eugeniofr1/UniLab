package com.unilab.controller;
import java.util.List;
import javax.validation.Valid;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.unilab.entity.LabRequest;


@RestController
@RequestMapping("/lab")
public class LabSchedulingController {
	
	@GetMapping
	public List <LabRequest> listar() {
		return null;	
	}	
	@GetMapping("/labid")
	public ResponseEntity<LabRequest> buscar(@PathVariable Long labid) {
		return null;
	}

	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public LabRequest adicionar (@Valid @RequestBody LabRequest laboratorio) {
		return null;
	}
	
	@PutMapping("/{labId}")
	public ResponseEntity<LabRequest> atualizar(@PathVariable Long labid,
			@Valid @RequestBody LabRequest laboratorio){
		
		return null;
	}


	@DeleteMapping("/{labid}")
	public ResponseEntity<Void> remover (@PathVariable Long labid){			
		return null;
	}

}
