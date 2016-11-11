/**
 * Created by Lilik on 17.12.2015.
 */
$(document).on('turbolinks:load', function() {
    var filterHead = $('.filter-heading-wrapper');
    var subFilter = $('.sub-filter-wrapper');
    var showMoreLink = $('.showmore-link-wrapper');
    var showMoreProducts = $('.showmore-thumbs-row');
    var reviewMore = $('.review-showmore-thumbs-row');
    var photoVideoMore = $('.photo-video-showmore-thumbs-row');
    var showMoreSimilar = $('#show-similar');
    var showMorePhoto = $('#show-photo');
    var showMoreVideo = $('#show-video');
    var plusIcon = $('.filter-plus-icon');
    var checkBox = $('.checkbox-inline');
    var catclicker ;
    var submitButtonSelector = 'a[data-submit-button="true"]';
    window.filterStatus = window.filterStatus || {
            'favourites': 'hide',
            'history-search': 'hide',
            'your-categories': 'show',
            'international-brands': 'hide',
            'local-brands': 'hide' };
    var filterStatus = window.filterStatus;

    $(document).on("page:change", function() {
        window.prevPageYOffset = window.pageYOffset;
        window.prevPageXOffset = window.pageXOffset;
    });
    $(document).on("page:load", function() {
        if( window.turbolinksScroll === false ){
            window.scrollTo( window.prevPageXOffset, window.prevPageYOffset );
        }
        window.turbolinksScroll = undefined;
    });

    $(document).on('click', 'a', function(event) {
        var scroll = $(this).data('turbolinks-scroll');
        if( scroll === false ){
            window.prevPageYOffset = window.pageYOffset;
            window.prevPageXOffset = window.pageXOffset;
        }
        window.turbolinksScroll = scroll;
    });


    var displaySearchResultsMore = function() {
        var hasMore = $('.search-results-have-more:last-child').data('hasmore');
        if( hasMore ) {
            showMoreProducts.show();
            reviewMore.show();
            photoVideoMore.show();
        }
        else {
            showMoreProducts.hide();
            reviewMore.hide();
            photoVideoMore.hide();
        }
    }

    displaySearchResultsMore();

    showMoreProducts.on('ajax:success', function( e, data, status, xhr ) {
        $('.search-results-container').append(data);
        displaySearchResultsMore();
        var prodLength = $('.search-results-container .thumb-wrapper').length;

        showMoreProducts.find('a').each(function(idx, el){
            this.href = this.href.replace(/page=(\d+)/, 'page='+$('.search-results-have-more:last-child').data('hasmore'));
            this.href = this.href.replace(/start_row_index=(\d+)/, 'start_row_index='+prodLength);

        });
    });

    reviewMore.on('ajax:success', function( e, data, status, xhr ) {
        $('.review-section').append(data);
        displaySearchResultsMore();
        var prodLength = $('.review-section .review-unit').length;

        reviewMore.find('a').each(function(idx, el){
            this.href = this.href.replace(/page=(\d+)/, 'page='+$('.search-results-have-more:last-child').data('hasmore'));
            this.href = this.href.replace(/start_row_index=(\d+)/, 'start_row_index='+prodLength);

        });
    });

    photoVideoMore.on('ajax:success', function( e, data, status, xhr ) {
        $('.photo-video-section').append(data);
        displaySearchResultsMore();
        var prodLength = $('.photo-video-section .photo-wrapper').length;

        photoVideoMore.find('a').each(function(idx, el){
            this.href = this.href.replace(/page=(\d+)/, 'page='+$('.search-results-have-more:last-child').data('hasmore'));
            this.href = this.href.replace(/start_row_index=(\d+)/, 'start_row_index='+prodLength);

        });
    });

    var displaySimilarMore = function() {
        var hasMore = $('.similar-have-more').last().data('hasmore');
        if( hasMore ) {
            showMoreSimilar.show();
        }
        else {
            showMoreSimilar.hide();
        }
    }
    displaySimilarMore();

    showMoreSimilar.on('ajax:success', function( e, data, status, xhr ) {
        $('.similar-wrapper').append(data);
        displaySimilarMore();
        var prodLength = $(data).filter('.thumb-wrapper').length;
        showMoreSimilar.find('a').each(function(idx, el){

            var remains = parseInt(this.text.replace("Show more (", "")) - prodLength;
            this.href = this.href.replace(/similar=(\d+)/, 'similar='+$('.similar-have-more').last().data('hasmore'));
            this.text =  "Show more ("+remains+")";


        });
    });
    var displayPhotoMore = function() {
        var hasMore = $('.photo-have-more').last().data('hasmore');
        if( hasMore ) {
            showMorePhoto.find('a').first().show();
        }
        else {
            showMorePhoto.find('a').first().hide();
        }
    }
    displayPhotoMore();
    showMorePhoto.on('ajax:success', function( e, data, status, xhr ) {
        $('.photo-wrapper').append(data);
        displayPhotoMore();
        var prodLength = $(data).filter('.thumb-wrapper').length;
        showMorePhoto.find('a').first().each(function(idx, el){

            var remains = parseInt(this.text.replace("Show more (", "")) - prodLength;
            this.href = this.href.replace(/photo=(\d+)/, 'similar='+$('.photo-have-more').last().data('hasmore'));
            this.text =  "Show more ("+remains+")";


        });
    });
    var displayVideoMore = function() {
        var hasMore = $('.video-have-more').last().data('hasmore');
        if( hasMore ) {
            showMoreVideo.find('a').first().show();
        }
        else {
            showMoreVideo.find('a').first().hide();
        }
    }

    displayVideoMore();
    showMoreVideo.on('ajax:success', function( e, data, status, xhr ) {
        $('.video-wrapper').append(data);
        displayVideoMore();
        var prodLength = $(data).filter('.thumb-wrapper').length;
        showMoreVideo.find('a').first().each(function(idx, el){

            var remains = parseInt(this.text.replace("Show more (", "")) - prodLength;
            this.href = this.href.replace(/photo=(\d+)/, 'video='+$('.video-have-more').last().data('hasmore'));
            this.text =  "Show more ("+remains+")";


        });
    });

    // Add pull-right and pull-left to side buttons in the header depending on the window size
    function repositionHeaderSideDropdowns() {
        var bodyWidth = $('body').width();
        if (bodyWidth < (893 + 82) && bodyWidth > (691 + 60)) {
            $('.header-side-dropdown-button').removeClass('pull-left').addClass('pull-right');
        } else if (bodyWidth <= (691 + 60)) {
            $('.header-side-dropdown-button').removeClass('pull-right').addClass('pull-left');
        } else {
            $('.header-side-dropdown-button').removeClass('pull-right').removeClass('pull-left');
        }
    }
    repositionHeaderSideDropdowns();
    $(window).resize(function() {
        repositionHeaderSideDropdowns();
    });

    // Update block position
    function setBlockPosition(button, block) {
        if(!$(button).is('*')) return true;
        var topPos = $(button).offset().top + 42;
        var rightOffset = $(document).width() - ($(button).offset().left + $(button).width());
        if (rightOffset > ($(block).outerWidth() - $(button).outerWidth())) {
            var leftPos = $(button).offset().left;
            $(block).css({
                'right': 'auto',
                'left': leftPos,
                'top': topPos
            });
        } else {
            $(block).css({
                'left': 'auto',
                'right': -1,
                'top': topPos
            });
        }
    }

    // Show 'burger' menu on mobile screen
    $('.mobile-burger-menu').click(function(){
        $('.main-menu-wrapper').slideToggle(200);
    });

    // Show 'filter' menu on mobile screen
    $('.mobile-filter-button').click(function(){
        $('.side-panel-wrapper').toggleClass('mobile-visible');
    });

    $('.mobile-filter-button').click(function(){
        $('.panel-wrapper').toggleClass('mobile-visible');
    });

    // Removing 'plus' icons if there are no sub-filters
    $(subFilter).each(function(){
        if($(this).find('.sub-filter-checkbox').length == 0){
            $(this).siblings('.filter-plus-icon').hide();
        }
    });

    // Adding a custom scrollbar for filtering
    var container = $('.filter-group-contents');
    $(container).perfectScrollbar({
        wheelSpeed: .1,
        wheelPropagation: true,
        minScrollbarLength: 20,
        scrollYMarginOffset: 150,
        maxScrollbarLength: 80
    });

    // Showing 'Your categories' filters by default

    for ( var filter in filterStatus ) {
        if( filterStatus[filter] === 'show' ) {
            var section = $('.filter-group.' + filter);
            section.children('.filter-group-contents').toggle().addClass('visible');
            $('.filter-group.' + filter + ' .filter-group-arrow').addClass('rotated');
            if(section.find('.filter-wrapper').length > 5){
                section.find('.showmore-link-wrapper:first').show();
            }
        }
    }


    // Hiding more than 5 filters
    if($(filterHead).siblings('.filter-group-contents').find('.filter-wrapper').length > 5){
        $(filterHead).siblings('.filter-group-contents').find('.filter-wrapper:gt(4)').hide();
    }

    // Toggling main filters
    $(filterHead).click(function(){
        $(this).siblings('.filter-group-contents').toggle(300).toggleClass('visible');
        $(this).children('.filter-group-arrow').toggleClass('rotated');
        var filterType = $(this).parents('.filter-group').data('type');

        if($(this).children('.filter-group-arrow').hasClass('rotated')){
            filterStatus[filterType] = 'show';
            if($(this).siblings('.filter-group-contents').find('.filter-wrapper').length > 5){
                $(this).nextAll('.showmore-link-wrapper:first').show(300);
            }
        }
        else {
            filterStatus[filterType] = 'hide';
            $(this).nextAll('.showmore-link-wrapper:first').hide(300);
        }

    });

    // Adding filter boxes to grey bar
    function applyFilter(filterText, filterCheckBoxId, isChecked){

        var filterHtml = "<div data-filterId="+filterCheckBoxId+" class='applied-filter'>" +
            "<span class='glyphicon glyphicon-remove'></span>" +
            "<span class='applied-filter-text'>"+filterText+"</span>";

        if(isChecked)
            $('.applied-filters-wrapper').append(filterHtml);

        var appliedFilters = $('.applied-filter');
        if(!isChecked){
            $(appliedFilters).each(function(){

                if($(this).attr('data-filterId') == filterCheckBoxId)
                    $(this).remove();
            });
            return 0;
        }
    }


    //  Showing/hiding filters sub-groups
    $(plusIcon).click(function(){
        if($(this).siblings('.sub-filter-wrapper').length > 0){
            $(this).siblings('.sub-filter-wrapper:first').toggle(300);
            $(this).toggleClass('glyphicon-minus');
        }
        if($(this).siblings('.checkbox-style:first').children('input').prop('checked') == true){
            var appliedFilter = $('.applied-filter');
            $(this).siblings('.checkbox-style:first').children('input').prop('checked', false);
        }
        else if($(this).siblings('.checkbox-style:first').children('input').prop('checked') == false) {
            $(this).siblings('.checkbox-style:first').children('input').prop('checked', true);
        }

    });

    $(checkBox).click(function(){
        if($(this).parent().siblings('.sub-filter-wrapper').length > 0){
            $(this).parent().siblings('.sub-filter-wrapper:first').toggle(300);
            $(this).parent().siblings('.filter-plus-icon').toggleClass('glyphicon-minus');
        }
    });

    // Behaviour of 'Show more' button
    $(showMoreLink).click(function(event){
        if($(this).children('.more-link').text() == 'More...'){
            $(this).siblings('.filter-group-contents').children('.filter-wrapper:gt(4)').show(400);
            $(this).siblings('.filter-group-contents').children('.ps-scrollbar-y-rail:first').css('display', 'block');
            $(this).children('.more-link').text('Less...');
        }
        else{
            $(this).siblings('.filter-group-contents').children('.filter-wrapper:gt(4)').hide(400)
            $(this).siblings('.filter-group-contents').children('.ps-scrollbar-y-rail:first').css('display', 'none');
            $(this).children('.more-link').text('More...');

        }
    });

    // Submit form with javascript
    $(document).on( "click", submitButtonSelector, function(event) {
        event.preventDefault();
        var targetButtonSelector = $(this).data('submit-target');
        if (targetButtonSelector && $(targetButtonSelector)) {
          $(targetButtonSelector).click();
        }
    });

    // Creates select stars widget for reviews
    document.linkRating = function(options){
        var widget = document.querySelector(options.widget);
        var field = $(options.field);

        var currentRating = field.val();

        var maxRating= 5;

        var callback = function(rating) { field.val(rating); };

        var myRating = rating(widget, currentRating, maxRating, callback);
    }

    var currentUrl = $(location).attr('href');

    if (currentUrl.endsWith('users/edit'))
        $('.navbar-default .navbar-nav > li').eq(0).addClass('active');
    else if (currentUrl.endsWith('users/review'))
        $('.navbar-default .navbar-nav > li').eq(1).addClass('active');
    else if (currentUrl.endsWith('users/photo'))
        $('.navbar-default .navbar-nav > li').eq(2).addClass('active');
    else if (currentUrl.endsWith('users/video'))
        $('.navbar-default .navbar-nav > li').eq(3).addClass('active');

    $('.navbar-default .navbar-nav > li').on('click', function() {
        $(this).siblings().removeClass('active');
        $(this).addClass('active');
    });

    $('.js-search-affix').affix({
      offset: {
        top: function() {
          return (this.top = $('.background-wrapper').outerHeight(false))
        }
      }
    });

    if ($('.js-zoom-photo').length) {
      $('.js-zoom-photo').magnificPopup({
        type: 'image',
        closeBtnInside: false,
        closeOnContentClick: true,
        image: {
          verticalFit: true
        }
      });
    }

    $('#btnLogin').on('click', function(e) {
        $('#SignInModal').modal({show: true});
    });
    $('#btnRegister').on('click', function(e) {
        $('#SignUpModal').modal({show: true});
    });

    $('.toggle-mobile-post-buttons').on('click', function(e){
      e.preventDefault();
      $('.mobile-post-button.photo').toggle();
      $('.mobile-post-button.video').toggle();
    })

    $('.toggle-product-menu').on('click', function(e){
      $('.social_share_group').hide();
      $(this).next('.menu-group').toggle();
    })

    $(document).on('click', function(){
      if($(event.target).is('.toggle-product-menu')) return;

      $('.menu-group').hide();
    })

    $('.remove-favourite').on('ajax:success', function(){
      $(this).closest('.thumb-product').remove();
    })

    $('.review-body-link').on('click', function(e) {
      e.preventDefault();
      var url, body;
      url = $(this).data('url');
      body = $.get(
        {
          url: url,
          success: function(obj){
            $(e.target).closest('p').html(obj.body);
          }
        }
      )
    })

    $('.show-filters-button').on('click', function(e){
      e.preventDefault();
      $(this).parent().siblings('.applied-filters-wrapper').toggle();
    })

    $('.toggle-social-share-menu').on('click', function(e){
      e.preventDefault
      $(this).parent().parent().parent().find('.social_share_group').toggle();
    })

    // hide social share menu
    window.onclick = function(event) {
      if (!event.target.matches('.social-share')) {
        $('.social_share_group').hide();
      }
    }

    $('.js-copylink').on('click', function(e){
      e.preventDefault
      var textField = document.createElement('textarea');
      textField.innerText = $('.js-copylink').last().data('copyUrl');
      document.body.appendChild(textField);
      textField.select();
      document.execCommand('copy');
      textField.remove();
    })

    function copyToClipboard(text) {
        var textField = document.createElement('textarea');
        textField.innerText = text;
        document.body.appendChild(textField);
        textField.select();
        document.execCommand('copy');
        textField.remove();
    }

    $('.js-toggle-product-details-block').on('click', function(e){
      var block;
      block = $(this).data('block-selector')
      $(block).toggleClass('short');
      $(this).toggleClass('glyphicon-menu-down');
      $(this).toggleClass('glyphicon-menu-up');
    })

    $('.product-tab-button').on('click', function(e){
      e.preventDefault();
      var tabs, tab;

      tabs = {
        characteristics: '.product-characteristics',
        company: '.product-company'
      }

      tab = $(this).html();
      $('.product-tab').addClass('hidden');
      $(tabs[tab]).removeClass('hidden');

      $('.product-tab-button.active').removeClass('active')
      $(this).addClass('active')
    })

    $('.bxslider').bxSlider({
      pagerCustom: '.bx-slider-pager'
    });
});
