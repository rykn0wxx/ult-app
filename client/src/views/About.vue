<template>
  <div class="about layout-column flex">
    <div class="headers flex mb-10">
      <h1>I am about</h1>
    </div>
    <div class="layout-column flex main-content">
      <div class="layout-row layout-align-space-around-center content layout-wrap mb-10 flex">
        <div class="box p-4 shadow text-center m-5" v-for="(box, indx) in boxes" :key="indx" :style="{backgroundColor: box}">
          <p class="md-title">{{ box }}</p>
        </div>
      </div>
      <div class="layout-row layout-align-space-around-center content layout-wrap mb-10 flex">
        <div class="box p-4 shadow text-center m-5" v-for="(accent, indx) in accents" :key="indx" :style="{backgroundColor: accent.code}">
          <h4 class="md-title">
            <pre>{{ accent }}</pre>
          </h4>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'About',
  data () {
    return {
      boxes: [
        '#27272f',
        '#33333d',
        '#373740',
        '#424250'
      ],
      accents: [
        {
          name: 'primary',
          code: '#1eb980'
        }, {
          name: 'dark-primary',
          code: '#045d56'
        }, {
          name: 'orange',
          code: '#ff6859'
        }, {
          name: 'yellow',
          code: '#ffcf44'
        }, {
          name: 'purple',
          code: '#b15dff'
        }, {
          name: 'blue',
          code: '#72deff'
        }
      ]
    }
  }
}
</script>

<style lang="scss" scoped>
.main-content {
  min-height: 128px;
  position: relative;
  display: flex;
  height: 100%;
  > .content {
    min-height: 128px;
    height: 100%;
    flex: 1 1 0;
  }
}
</style>
