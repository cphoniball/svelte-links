<script>
  import { goto } from "@sapper/app";

  import Input from "../../components/form/Input.svelte";
  import Email from "../../components/form/Email.svelte";
  import Password from "../../components/form/Password.svelte";

  const initialUser = {
    username: "",
    email: "",
    password: "",
    password_confirmation: ""
  };

  let user = { ...initialUser };
  let errorMessage = null;

  const createUser = async () => {
    const response = await fetch("http://localhost:4000/users", {
      method: "post",
      body: JSON.stringify(user),
      headers: { "Content-Type": "application/json" }
    });

    user = { ...initialUser };

    return response.status === 201 ? { status: "ok" } : { status: "error" };
  };

  const submitCreateUser = async () => {
    const { status } = await createUser();

    if (status === "ok") {
      return goto("/register/success");
    } else {
      errorMessage =
        "Could not create user account, please correct errors below.";
    }
  };
</script>

<form on:submit|preventDefault={submitCreateUser}>
  {#if errorMessage}
    <div class="alert alert-danger">{errorMessage}</div>
  {/if}

  <Input value={user.username} label="Username" name="username" />
  <Email value={user.email} label="Email Address" name="email" />
  <Password value={user.password} label="Password" name="password" />
  <Password
    value={user.password_confirmation}
    label="Password Confirmation"
    name="password_confirmation" />

  <button type="submit" class="btn btn-primary">Create Account</button>
</form>
