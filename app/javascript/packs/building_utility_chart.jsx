import React from 'react'
import ReactDOM from 'react-dom'
import BuildingChart from './components/BuildingChart'

document.addEventListener('turbolinks:load', () => {
  const element = document.querySelector('#building-utility-chart')
  if (!element) return

  ReactDOM.render(
    <BuildingChart />,
    element
  )
})

document.addEventListener('turbolinks:before-render', () => {
  const element = document.querySelector('#building-utility-chart')
  if (element) ReactDOM.unmountComponentAtNode(element)
})