package com.unilab.controller;

import java.util.List;

import javax.validation.Valid;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
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

import com.unilab.entity.UserRequest;
import com.unilab.entity.UserRequestRepository;

@RestController
@RequestMapping("/clientes")
public class UserController {
	
	@Autowired
	private UserRequestRepository clienteRepository;
	
	@GetMapping
	public List <UserRequest> listar() {
		return clienteRepository.findAll();	
	}	
	@GetMapping("/{clienteid}")
	public ResponseEntity<UserRequest> buscar(@PathVariable Long clienteid) {
		Optional<UserRequest> cliente = clienteRepository.findById(clienteid);
		
		if (cliente.isPresent()) {
			return ResponseEntity.ok(cliente.get());
		}		return ResponseEntity.notFound().build();
	}
	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public UserRequest adicionar (@Valid @RequestBody UserRequest cliente) {
		return clienteRepository.save(cliente);
	}
	
	@PutMapping("/{clienteId}")
	public ResponseEntity<UserRequest> atualizar(@PathVariable Long clienteId,
			@Valid @RequestBody UserRequest cliente){
		if(!clienteRepository.existsById(clienteId)) {
			return ResponseEntity.notFound().build();
		}
		cliente.setId(clienteId);		
		cliente = clienteRepository.save(cliente);
		
		
		return ResponseEntity.ok(cliente);
	}
	@DeleteMapping("/{clienteId}")
	public ResponseEntity<Void> remover (@PathVariable Long clienteId){
		if(!clienteRepository.existsById(clienteId)) {
			return ResponseEntity.notFound().build();
		}
		
		clienteRepository.deleteById(clienteId) ;
			
		return ResponseEntity.noContent().build();
	}
}
