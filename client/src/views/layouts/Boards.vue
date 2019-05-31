<template>
  <div class="layouts-boards layout-row flex">
    <div class="layout-column flex" tabindex="-1" role="main">
      <MdToolbar />
      <md-content class="board-content layout-column layout-padding flex bg-theme-dark04" :md-scroll-y="true">
        <MdView class="no-padding h-full bg-theme-dark04" />
      </md-content>
    </div>
  </div>
</template>

<script>
export default {
  name: 'LayoutsBoards'
}
</script>

<style lang="scss" scoped>
@import "../../sass/mixins";
.board-content {
  @include prop-to-value('padding-top', 20px, true);
  // background-color: #718096;
}
.no-padding {
  @include prop-to-value(padding, 0, true);
  // background-color: #718096;
}
</style>
