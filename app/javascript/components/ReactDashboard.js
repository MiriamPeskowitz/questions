import React from "react";

export const ReactDashboard = () => {


  const getAllResponses  = () => {
    fetch(`http://localhost:3000/api/v1/responses?name=Zan`)
      .then(res => res.json())
      .then( resp => {
          resp.map((r) => r.response)
      })
  }

 

  return (
   <p>Zan's reponses
    { getAllResponses() }
  </p>
    )

};


//form to take in the name 