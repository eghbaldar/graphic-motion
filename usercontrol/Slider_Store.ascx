<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Slider_Store.ascx.vb"
    Inherits="usercontrol_Slider_Store" %>
<script>
    $(function () {

        var imgs = [
          'Content/Upload/images/Store/BigPic/store_ae_1.jpg',
          'Content/Upload/images/Store/BigPic/store_ae_2.jpg',
          'Content/Upload/images/Store/BigPic/store_ae_1.jpg',
          'Content/Upload/images/Store/BigPic/store_ae_2.jpg',
          'Content/Upload/images/Store/BigPic/store_ae_1.jpg'];

        var maximages = imgs.length; //No of Images
        Slider();
        setInterval(Slider, 3000);
        var prevIndex = 0, prevPrevIndex = 0;

        function Slider() {
            $('#imageSlide').fadeOut("slow", function () {
                do {
                    shuffleIndex = Math.floor(Math.random() * maximages);
                } while (prevIndex == shuffleIndex || prevPrevIndex == shuffleIndex)

                prevPrevIndex = prevIndex;
                prevIndex = shuffleIndex;

                $("#panel").fadeIn("slow").css('background', '#000');

                $(this).attr('src', imgs[shuffleIndex]).fadeIn("slow");
            });
        }

    });
</script>
<a href="http://www.graphic-motion.ir/%D8%AA%D9%85%D8%A7%D9%85%DB%8C-%D8%A8%D8%B3%D8%AA%D9%87-%D9%87%D8%A7%DB%8C-%D8%A2%D9%85%D9%88%D8%B2%D8%B4%DB%8C"
    target="_blank">
<img id="imageSlide" alt="" src="" border="0" /></a>