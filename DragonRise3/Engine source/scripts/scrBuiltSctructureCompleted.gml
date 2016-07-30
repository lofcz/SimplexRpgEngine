/// scrBuiltSctructureCompleted()

var object;
object = id;

if (argument_count > 0) {object = argument[0];}

with(object)
    {
q = 0;
if (instance_place(x + 32, y, oFence) != noone)
    {
      q = instance_place(x + 32, y, oFence);
if (q.canCheck) { q.canCheck = false; if (!q.built) {global.result = false;} with(q) {event_user(0);} scrBuiltSctructureCompleted(q)} 

 } 

if (instance_place(x - 32, y, oFence) != noone)
    {
      q = instance_place(x - 32, y, oFence);
if (q.canCheck) {q.canCheck = false;  if (!q.built) {global.result = false;} with(q) {event_user(0);} scrBuiltSctructureCompleted(q)} 
    }

if (instance_place(x, y + 32, oFence) != noone)
    {
      q = instance_place(x, y + 32, oFence);
if (q.canCheck) {q.canCheck = false;   if (!q.built) {global.result = false;} with(q) {event_user(0);} scrBuiltSctructureCompleted(q)} 
    }

if (instance_place(x, y - 32, oFence) != noone)
    {
      q = instance_place(x, y - 32, oFence);
if (q.canCheck) {q.canCheck = false;  if (!q.built) {global.result = false;} with(q) {event_user(0);} scrBuiltSctructureCompleted(q)}       
    }

    }
    
if (!built) {global.result = 0;}
canCheck = false;    

