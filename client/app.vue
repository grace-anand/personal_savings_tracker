<template>
  <Button label="Clieck Me" icon="pi pi-search" class="p-button-text" />

  <Form class="flex justify-center items-center h-screen">
    <Field
      class="border-black border-solid border"
      name="email"
      type="email"
      placeholder="Enter email"
      :rules="fieldSchema"
    />
    <ErrorMessage name="email" />
  </Form>
</template>

<script setup lang="ts">
import { Field, Form, ErrorMessage } from "vee-validate";
import { toFieldValidator } from "@vee-validate/zod";
import Button from "primevue/button";
import * as zod from "zod";
const fieldSchema = toFieldValidator(
  zod.string().nonempty("Field is required").email("Must be a valid email")
);
</script>
