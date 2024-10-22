package com.py.api.model.serializer;

import java.io.IOException;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.py.api.model.entity.ContaReceber;

public class ContaReceberSerializer extends JsonSerializer<ContaReceber> {

	@Override
	public void serialize(ContaReceber value, JsonGenerator gen, SerializerProvider serializers)
			throws IOException {
		
		gen.writeStartObject();
		gen.writeNumberField("id", value.getId());
		gen.writeEndObject();
		
	}

}


