<template>
  <div class="auths-login login-card">
    <div class="login-card__body">
      <form @submit.prevent ref="form" name="loginForm" class="login-form" novalidate>
        <router-link class="login-form__link" to="/">
          <AnonLogo class="login-form__logo" />
        </router-link>
        <h1 class="md-title login-form__header">rykn0wxx</h1>
        <div class="login-form__group mt-12 flex layout-column layout-align-center-stretch">
          <input v-model="auth.login" type="text" name="login" id="login" class="login-form__input" placeholder="Username or Email" autocomplete="off" required />
        </div>
        <div class="login-form__group mt-12 flex layout-column layout-align-center-stretch">
          <input v-model="auth.password" type="password" name="password" id="password" class="login-form__input" placeholder="Password..." autocomplete="off" required />
        </div>
        <div class="login-form__group mt-12 flex layout-align-end">
          <input @click.stop="submitLoginForm" type="submit" name="sibmit" class="login-form__btn md-button" value="Submit" />
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import { mapActions } from 'vuex'

export default {
  name: 'AuthsLogin',
  data () {
    return {
      auth: {
        login: 'me',
        password: 'me'
      }
    }
  },
  methods: {
    ...mapActions('users', {
      setToken: 'setToken',
      setUser: 'setUser'
    }),
    async submitLoginForm ($event) {
      if (this.$refs.form.checkValidity()) {
        try {
          await this.setToken({ auth: this.auth })
          this.$router.push('/')
        } catch (error) {
          console.error(error)
        }
      }
      $event.target.blur()
    }
  }
}
</script>

<style lang="scss" scoped>
.login {
  &-card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: rgba(#353c48, 0.9);
    background-clip: border-box;
    border: 0 solid transparent;
    border-radius: 0;
    &__body {
      flex: 1 1 auto;
      padding: 1.25rem;
    }
  }
  &-form {
    text-align: center;
    &__header {
      margin: 0.5rem 0;
      color: rgba(#b2b9bf, 0.87);
    }
    &__link {
      height: 60px;
      display: inherit;
    }
    &__logo {
      display: inline-block;
    }
    &__input {
      background-image: linear-gradient(#fb9678,#fb9678),linear-gradient(#272c36,#272c36);
      border: 0;
      border-radius: 0;
      box-shadow: none;
      background-color: rgba(0,0,0,0);
      background-position: center bottom,center calc(100% - 1px);
      background-repeat: no-repeat;
      background-size: 0 2px,100% 1px;
      padding: 0 0 0 10px;
      transition: background 0s ease-out 0s;
      min-height: 40px;
      width: 100%;
      height: calc(1.5em + .75rem + 2px);
      font-size: 1.5rem;
      line-height: 1.5;
      background-clip: padding-box;
      &:focus {
        background-size: 100% 2px,100% 1px;
        outline: 0;
        transition-duration: .3s;
      }
    }
    &__btn {
      &:hover {
        background-color: rgba(158,158,158,0.2);
      }
      &:active {
        box-shadow: 0 4px 8px 0 rgba(0,0,0,.4);
      }
      &:focus {
        box-shadow: 0 2px 5px 0 rgba(0,0,0,.26);
      }
    }
  }
}
</style>
