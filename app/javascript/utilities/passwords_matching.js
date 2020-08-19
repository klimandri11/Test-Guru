document.addEventListener('turbolinks:load', function() {
  var passwordConfirmation = document.querySelector('#user_password_confirmation')
  
  if (passwordConfirmation) { passwordConfirmation.addEventListener('input', MatchingPasswords) }
})

function MatchingPasswords() {
  var password = document.querySelector('#user_password')

  if (!this.value) {
    this.parentElement.querySelector('.octicon-shield-check').classList.add('hide')
    this.parentElement.querySelector('.octicon-shield').classList.add('hide')
  }
  else if (this.value == password.value) {
    this.parentElement.querySelector('.octicon-shield-check').classList.remove('hide')
    this.parentElement.querySelector('.octicon-shield').classList.add('hide')
  }
  else {
    this.parentElement.querySelector('.octicon-shield-check').classList.add('hide')
    this.parentElement.querySelector('.octicon-shield').classList.remove('hide')
  }
}
