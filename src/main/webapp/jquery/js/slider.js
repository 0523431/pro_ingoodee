/**
 * Created by Nalrarang on 2017. 3. 7
 */
/**
메인 화면 상단 배너 이미지 슬라이드
@namespace Slider
@author nalrarang@gmail.com
@logs 20170307:Nalrarang update
*/

var Slider = function(){
    this._elem = null;
    this.index = 0;
    this.maxCount = 0;
    this.isAuto = false;
    this.type = 'Main';

    var moveSlide = function(elem, idx){
        elem.css({
            '-ms-transform' : 'translate3d('+ idx * -100 +'%,0,0)',
            '-webkit-transform' : 'translate3d('+ idx * -100 +'%,0,0)',
            'transform' : 'translate3d('+ idx * -100 +'%,0,0)'
        });
    }

    this.init = function(elem, maxCount, isAuto){
        this._elem = elem;
        this.maxCount = maxCount;
    };
    this.prev = function(){
        this.index--;
        if(this.index < 0){
            this.index = this.maxCount; 
        }
        console.log(this.index);
        moveSlide(this._elem, this.index);
        return this.index;
    };
    this.next = function(){
        this.index++;
        if(this.index > this.maxCount){
            this.index = 0;
        }
        moveSlide(this._elem, this.index);
        return this.index;
    };
    this.move = function(idx){
        this.index = idx;
        moveSlide(this._elem, this.index);
    }
};