function checkAnswer(){
    var ans = a=document.getElementById("answer");
    if(ans.value=="whats_a_matter_rabbit?"){
        document.getElementById('err').textContent= 'CORRECT'
        document.getElementById('err').style.color = 'green'
    }
    else{
        document.getElementById('err').textContent= 'INCORRECT'
        document.getElementById('err').style.color = 'red'
    }
}
