
const collapseR = () =>{
    document.getElementById('sidebar-r').classList.toggle('col-3');
    document.getElementById('sidebar-r').classList.toggle('col-1');
    for (let i = 0; i < document.getElementsByClassName('suggested-user').length; i++) {
        document.getElementsByClassName('suggested-user')[i].classList.toggle('d-none')
    }
    for (let i = 0; i < document.getElementsByClassName('suggested-topic').length; i++) {
        document.getElementsByClassName('suggested-topic')[i].classList.toggle('d-none')
    }
    
    for (let i = 0; i < document.getElementsByClassName('suggested').length; i++) {
        document.getElementsByClassName('suggested')[i].classList.toggle('justify-content-center')
        
    }
}

const collapseL = () =>{
    document.getElementById('sidebar-l').classList.toggle('col-3');
    document.getElementById('sidebar-l').classList.toggle('col-1');

    document.getElementById('user-profile').classList.toggle('ps-4');
    document.getElementById('user-profile').classList.toggle('justify-content-center');
    document.getElementById('user-profile').getElementsByClassName('info')[0].classList.toggle('d-none')

    for (let i = 0; i <document.getElementsByClassName('tab-text').length; i++) {
        document.getElementsByClassName('tab-text')[i].classList.toggle('d-none')
        document.getElementsByClassName('tab')[i].classList.toggle('justify-content-center') 
    }
    document.getElementById('tabs').classList.toggle('ps-4')

    document.getElementsByClassName('info-text')[0].classList.toggle('d-none')
    document.getElementsByClassName('info-tooltip')[0].classList.toggle('d-none')
}

$(document).ready(function(){
    $('[data-bs-toggle="popover"]').popover({
        container: 'body',
        animation: false,
        html: true,
        content: '<a href="about.html" class="list-group-item list-group-item-action">Acerca de</a><a href="contact.html" class="list-group-item list-group-item-action">Contacto</a> <a href="faq.html" class="list-group-item list-group-item-action">FAQ</a><a href="#" class="list-group-item list-group-item-action">Repositorio</a>'
    });   
});