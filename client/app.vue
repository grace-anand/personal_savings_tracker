<template>
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

<script setup>
import { Field, Form, ErrorMessage } from "vee-validate";
import { toFieldValidator } from "@vee-validate/zod";
import * as zod from "zod";
const fieldSchema = toFieldValidator(
  zod.string().nonempty("Field is required").email("Must be a valid email")
);
</script>
