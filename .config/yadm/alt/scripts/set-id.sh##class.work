#! /bin/bash


echo "Setting asserts" 
smcc set-property tao.prod.follower.frc.tiny.asserts leaf_id 1
smcc set-property -f tao.prod.follower.frc.tiny.asserts leaf_weight 0.0001
smcc set-property tao.prod.follower.frc.tiny.asserts leaf_type failover
smcc set-property tao.prod.follower.frc.tiny.asserts salt assertstiny

echo "Setting opt"
smcc set-property tao.prod.follower.frc.tiny.opt leaf_id 2
smcc set-property -f tao.prod.follower.frc.tiny.opt leaf_weight 1.0
smcc set-property tao.prod.follower.frc.tiny.opt leaf_type failover
smcc set-property tao.prod.follower.frc.tiny.opt salt opttiny

echo "Setting profile"
smcc set-property tao.prod.follower.frc.tiny.profile leaf_id 3
smcc set-property -f tao.prod.follower.frc.tiny.profile leaf_weight 0.001
smcc set-property tao.prod.follower.frc.tiny.profile leaf_type failover
smcc set-property tao.prod.follower.frc.tiny.profile salt profiletiny

echo "Diff to asserts ash"
diff <(smcc list-properties tao.prod.follower.frc.tiny.asserts) <(smcc list-properties tao.prod.follower.frc.1.asserts) 

echo "Diff to opt ash"
diff <(smcc list-properties tao.prod.follower.frc.tiny.opt) <(smcc list-properties tao.prod.follower.frc.1.opt) 


echo "Diff to profile ash"
diff <(smcc list-properties tao.prod.follower.frc.tiny.profile) <(smcc list-properties tao.prod.follower.frc.1.profile) 



