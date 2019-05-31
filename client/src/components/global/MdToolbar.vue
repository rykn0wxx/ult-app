<template>
  <div class="md-toolbar md-whiteframe-glow-z1 _md-toolbar-transitions bg-theme-darken">
    <div class="md-toolbar-tools" tabindex="-1">
      <div class="layout-row flex fill-height">
        <h2 class="md-headline">
          Introduction
        </h2>
        <span class="flex"></span>
        <div class="md-toolbar-item layout-row">
          <router-link to="/home" class="md-button">Home</router-link>
          <router-link to="/about" class="md-button">About</router-link>
          <router-link to="/boards" class="md-button">Boards</router-link>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'MdToolbar'
}
</script>

<style lang="scss" scoped>
@import '../../sass/variables';
@import '../../sass/mixins';
$md-toolbar-height: $baseline-grid * 8;
$md-toolbar-medium-tall-height: 88px;
$md-toolbar-tall-height: 128px;
$md-toolbar-height-mobile-portrait: 56px;
$md-toolbar-height-mobile-landscape: 48px;
$md-toolbar-indent-margin: 64px;
$md-toolbar-padding: 16px;
$icon-button-margin-offset: rem(-0.800);
.md-toolbar {
  box-sizing: border-box;
  display: flex;
  flex-direction: column;
  position: relative;
  z-index: 2;
  font-size: rem(2.0);
  min-height: $md-toolbar-height;
  width: 100%;
  &._md-toolbar-transitions {
    transition-duration: $swift-ease-in-out-duration;
    transition-timing-function: $swift-ease-in-out-timing-function;
    transition-property: background-color, fill, color;
  }
  &.md-whiteframe-z1-add, &.md-whiteframe-z1-remove {
    transition: box-shadow $swift-ease-in-out-duration linear;
  }
  .md-toolbar-filler {
    width: 9 * $baseline-grid;
  }
  *, *:before, *:after {
    box-sizing: border-box;
  }
  &.md-tall {
    height: $md-toolbar-tall-height;
    min-height: $md-toolbar-tall-height;
    max-height: $md-toolbar-tall-height;
  }
  &.md-medium-tall {
    height: $md-toolbar-medium-tall-height;
    min-height: $md-toolbar-medium-tall-height;
    max-height: $md-toolbar-medium-tall-height;
    .md-toolbar-tools {
      height: 48px;
      min-height: 48px;
      max-height: 48px;
    }
  }
  > .md-indent {
    @include rtl-prop(margin-left, margin-right, $md-toolbar-indent-margin, auto);
  }
  ~ .md-content {
    > .md-list {
      padding: 0;
      .md-list-item:last-child {
        .md-divider {
          display: none;
        }
      }
    }
  }
  &.md-whiteframe-glow-z1 {
    z-index: 3;
    box-shadow: 0 0 1px 1px rgba(0, 0, 0, 0.14), 0 0 2px 2px rgba(0, 0, 0, 0.098), 0 0 5px 1px rgba(0, 0, 0, 0.084);
  }
}
.md-toolbar-tools {
  font-size: $title-font-size-base;
  letter-spacing: 0.005em;
  box-sizing: border-box;
  font-weight: 400;
  display: flex;
  align-items: center;
  flex-direction: row;
  width: 100%;
  height: $md-toolbar-height;
  max-height: $md-toolbar-height;
  padding: 0 $md-toolbar-padding;
  margin: 0;
  h1, h2, h3 {
    font-size: inherit;
    font-weight: inherit;
    margin: inherit;
  }
  a {
    color: inherit;
    text-decoration: none;
  }
  .fill-height {
    display: flex;
    align-items: center;
  }
  .md-checkbox {
    margin: inherit;
  }
  .md-button {
    margin-top: 0;
    margin-bottom: 0;
    &, &.md-icon-button md-icon {
      transition-duration: $swift-ease-in-out-duration;
      transition-timing-function: $swift-ease-in-out-timing-function;
      transition-property: background-color, fill, color;
      &.ng-animate {
        transition: none;
      }
    }
  }
  &> .md-button:first-child {
    @include rtl-prop(margin-left, margin-right, $icon-button-margin-offset, auto);
  }
  &> .md-button:last-child {
    @include rtl-prop(margin-right, margin-left, $icon-button-margin-offset, auto);
  }
  &> .md-menu:last-child {
    @include rtl-prop(margin-right, margin-left, $icon-button-margin-offset, auto);
    & > .md-button {
      @include rtl-prop(margin-right, margin-left, 0, auto);
    }
  }
  @media screen and (-ms-high-contrast: active) {
    border-bottom: 1px solid #fff;
  }
}
@media (min-width: 0) and (max-width: $layout-breakpoint-sm - 1) and (orientation: portrait) {
  .md-toolbar {
    min-height: $md-toolbar-height-mobile-portrait;
  }
  .md-toolbar-tools {
    height: $md-toolbar-height-mobile-portrait;
    max-height: $md-toolbar-height-mobile-portrait;
  }
}
@media (min-width: 0) and (max-width: $layout-breakpoint-sm - 1) and (orientation: landscape) {
  .md-toolbar {
    min-height: $md-toolbar-height-mobile-landscape;
  }
  .md-toolbar-tools {
    height: $md-toolbar-height-mobile-landscape;
    max-height: $md-toolbar-height-mobile-landscape;
  }
}
</style>
