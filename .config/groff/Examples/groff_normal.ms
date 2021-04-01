.PDFPIC -C /home/sudarson/Study/MEDET/genericlogo.pdf 5
.defcolor sea rgb #1D7E74
.nr HM 0.8i \" Set Header and footer margins
.nr FM 0.8i
.so /home/sudarson/.config/groff/macros.ms
.R1
accumulate
bracket-label \*([.[ ]\*(.] ", "
.R2
\#
\# *** VERY IMPORTANT ***
\# Use "$ equation $" within text to include math in paragraphs
\#
.EQ
delim $$
.EN
.ds CH
.ds CF
.nr LL 6.2i     \" Line width
.
.
.CD
.sp 0
.ps 28
.B "Pipe Inspection Robot"
.sp
.ps 14
.I "Sudarson NANTHACOUMARANE"
.sp 0.1i
(2020 - 2021)
.sp 4
.ps 20
Mechanical Design Project
.sp 0.2i
.ps 24
.pdfhref W -D https://www.gnu.org/software/groff/ Generic University
.sp
.ps 14
.I "24th March, 2021"
.DE
.
.
.ad c
Here is
some uninteresting text
.br
.ad n
.bp
.sv 15
.CD
.ps 16
.B
.UL "Abstract"
.DE
.nr PS 12
.nr VS 17
.PP
The deterioration occurring over time is the main reason for the regular inspection for pipelines. A lot of reasons factor in for the cause of this deterioration ranging from normal corrosion, leaks to cracks and punctures that may result in blowbacks and end up damaging the operator and its environment. Human inspection of pipelines is labour intensive and hazardous in cases where the pipes carry toxic fluids. In order to prevent risking human health and to explore inaccessible environments, autonomous inspection of pipelines are becoming more and more reliable with the use of robots. Piping inspection robots find their applications for industries such as nuclear, chemical and sewage. The major challenge in the design of these robots lies in the choice of an appropriate locomotion principle and articulation unit owing to factors like cable management, passage through complex pipe bends and having a continuous contact with pipeline walls. The main focus of this project is to study existing robotic piping inspection methods and to develop innovative and effective designs which can have vertical, horizontal and curved profiles.
.
.
.pn -1 \" Manipulate Page Numbering
.bp
.ds CH          \" Empty header (centred)
.ds CF - % -    \" Foooter with page number (centred)
.nr PS 16
.NH
.nr PS  12
.XN "Introduction"
.PP
Since the advent of the industrial age, maintenance has been vital to ensure progress. Pipe systems have been at the heart of almost all industries, especially, chemical, nuclear and petroleum. Regular and periodic inspection of pipelines have always been a high priority to prevent pipeline bursts, puncture, fracture and buckling. Time and time again, manual inspection has proven to be not only error prone and time consuming but also to pose a threat to human health and can lead to long term effects of radiation. For these reasons, pipe inspection by robots is becoming increasingly popular. Several scientific research communities are dedicating their time and effort to improve the design of such robots.
.[
robot_market2
.]
.PP
In China, the natural petroleum energy sector has become a billion dollar investment with an ardent focus on the management of refinement, storage and transportation of oil products. For the continued success of such a humongous business, it has been absolutely crucial to conduct regular maintenance and repair of the oil pipelines which serves as an important component connecting all facilities. Owing to the vast distances covered by these pipelines, periodic human inspection has become very expensive as well as time consuming. Therefore, in recent years there has been a skyrocketing demand to obtain an effective method of autonomous inspection using the robot technologies. These robots are expected to easily maneuver in pipelines of varying sizes and have the capability to thoroughly inspect the pipes for any damage or blockage.
.sp
.nr PS 16
.NH
.nr PS 12
.XN "Functional Requirements and Design Parameters"
.PDFPIC -C /home/sudarson/Study/MEDET/Images/FRDP.pdf 6.5
.
.bp
.nr PS 16
.NH
.nr PS 12
.XN "Market Study"
.PP
One of the key factors that drives the market of the Pipe Inspection Robot Market is the fact that these robots are customized to operate in highly deft surroundings and are capable of working in toxic environments. This in turn has generated a huge market for pipe inspection robots. An important reason that has been aiding the growth of the  market for pipe inspection robots is that the availability of skilled labor has been decreasing  in recent years. The global market for the pipe inspection robots was valued at 605 million USD in the year 2017 and is expected to cross 2,450 million USD by the end of the year 2026.
.[
robot_market2
.]
.PP
 In several industries, the pipelines are inspected continuously for efficiency and security. Operations like cleaning, maintenance, and inspection have proven to be expensive when manual labour is used and thus applications of pipe inspection robots appears to be an attractive solution. Not only is manual labour expensive but also the fact that the inspection of pipeline network utilises a lot of manpower results in the companies incurring additional costs. Although using pipe inspection robots are expensive at first, it  works with greater accuracy and results in the generation of positive cash flow over a period of time. This will in turn boost the use of pipe inspection robots market over the forecast period. As the demand for oil and gas is increasing at a large scale across the globe, it is expected that the pipeline network will increase rapidly in the near future resulting in increasing the popularity of the market for pipe inspection robots. Gas pipelines have accounted for the largest market share in the year 2017 with a percentage of 37.22%. The application of pipe inspection robots in gas pipelines was valued at 225.75 million USD in 2017 and it is expected to cross 881.29 million USD by the end of 2026.
.[
robot_market2
.]
.PP
There is a deposition of a wax-like substance on the walls of the pipelines which occurs very often due to the change in the temperatures of the pipeline walls. This has resulted in growth in the usage of in-pipe inspection robots for gas pipelines. The growth in the market of pipe inspection robots is expected to be the highest in the Asia Pacific. This huge growth in the Asia Pacific region is due to the increasing investment in the transportation of petrochemical products using the pipeline network. This is estimated to create a huge market for pipe inspection robots in the Asia Pacific. In Europe, the market for Pipe Inspection Robot is expected to witness development adhering to increasing demand for energy-efficient alternatives and increasing numbers of reduction in greenhouse gas emission  projects all of which require the implementation of Pipe Inspection Robots on a grand scale.
.[
robot_market1
.]
North America is anticipated to retain a significant market share of Pipe Inspection Robots. Owing to the modern infrastructure which  accounts for the large pipeline network.
.[
robot_market1
.]
The top global Key players in the Pipe Inspection Robot Market are: GE Inspection Robotics, Honeybee Robotics, Inuktun Services and CUES Inc.
.[
robot_market5
.]
.
.bp
.nr PS 16
.NH
.nr PS 12
.XN "Existing Research"
.PP
Methods of autonomous inspection of pipelines are a widely researched subject which find their use in the petrochemical and fluid industry as well as when human access becomes difficult.
.[
pipe_search
.]
A lot of work has been done in order to develop and enhance pipe inspection robots especially in areas of their motion, vision and control.
.[
pipe_hal
.]
Based on their design, capabilities and limitations, these robots are widely classified under three categories, namely, Wheel Type Robot, Caterpillar Type Robot and Without Wheel Type Robots.
.[
pipe_review
.]
.PDFPIC -C "/home/sudarson/Study/MEDET/Images/flowchart.pdf" 6.5
.nr PS 14
.NH 2
.nr PS 12
.XN "Wheel Type Robots"
.PP
As the name suggests, in Wheel Type Robots, the wheels are attached directly to the body of the motor in order to get the desired motion. These robots have a simple design and have a better velocity control. The Wheel Type Robots are further classified into: Simple structure, Wall pressed type and Screw drive type robots.
.nr PS 14
.NH 2
.nr PS 12
.XN "Caterpillar Type Robots"
.PP
Similarly, Caterpillar Type Robots are also classified into two: Simple structure and Wall pressed. Simple structures type of caterpillar robot have belt bound wheels and these wheels are attached to the actuators. These types of wheels provide friction to the robots and cause the movement of the robots even on an uneven surface. Wall pressed type of caterpillar robots are designed so that they are capable of vertical motion.
.nr PS 14
.NH 2
.nr PS 12
.XN "Without Wheel Type Robots"
.PP
Without Wheel Type Robots can be further classified into three sub-categories, namely, Leg type robots, Inchworm type robots and Snake type robots. The Inchworm type of without wheels robots move with the help of two clamping and an elastic module. Snake type of without wheels robots have numerous articulated modules whereas Leg type of without wheels robots are able to climb vertically as well as move horizontally because of the different types of joints.
.nr PS 16
.NH
.nr PS 12
.XN "Pre-Existing Designs"
.nr PS 14
.NH 2
.nr PS 12
In-Pipe Inspection Minirobot, Technical University of Cluj-Napoca
.[
pipe_simple
.]
.PP
This minirobot with the aim of inspecting pipes in the range of 220mm to 380mm has a very simple design. Each set of wheels is driven by an electric motor, and the height of the wheels is controlled with a scissor joint mechanism. The robot does not have a battery pack and always needs to be connected to a power supply. Continuing with the simple theme of the robot, it only features a normal camera which can take pictures when the user wishes.
.sp 0.15i
.PDFPIC -C /home/sudarson/Study/MEDET/Images/simple.pdf 5
.nr PS 14
.NH 2
.nr PS 12
Large pipe inspection robot for CNPC
.[
pipe_6x
.]
.PP
This robot was developed to inspect oil pipelines for China National Petroleum Corporation. Their aim was to reduce danger to human life while inspecting large oil pipelines, which can often be full of poisonous liquids. Their design is an improvement of a previous model of robot which now features a more powerful motor for climbing up pipes on the sides of mountains, and extra wheels for traction. However, the addition of these features has increased the complexity manyfold. The inspection system used 2k linear array CCD camera units.
.PDFPIC -C /home/sudarson/Study/MEDET/Images/6x_Robot.pdf 5
.nr PS 14
.NH 2
.nr PS 12
Screw-type pipe inspection robot, NITTTR
.[
screw
.]
.PP
The screw-type pipe inspection robot has very good vertical mobility and is preferred for pipelines with steep angles. It features two bodies - a forward continuously rotating body, and a rearward trailing body. The robot has extremely good traction due to its motion, which moves like a screw being threaded into a hole.
.PDFPIC -C /home/sudarson/Study/MEDET/Images/screw.pdf 3
.nr PS 14
.NH 2
.nr PS 12
Belt Driven and Cone Shaped robot
.[
caterpillar
.]
.PP
Caterpillar tracks offer much better traction than normal rubber-based wheels. This robot takes full advantage of that fact, and also adds hemispherical wheels to sides of the caterpillar tracks to increase traction even further. The unique shape of this robot allows it to traverse through pipelines of different cross-section shapes as well. This device only contains a micro-camera and LED lighting group as inspection instruments.
.PDFPIC -C /home/sudarson/Study/MEDET/Images/caterpillar.pdf 5
.nr PS 14
.NH 2
.nr PS 12
Magnetic-Wheeled Robot
.[
magnet
.]
.PP
The unique magnetic wheels in this robot allow it to travel almost anywhere within a pipeline, as long as the pipe is made out of a ferromagnetic material. The small size of this model makes it extremely versatile. It also comes with realtime HD video and ultrasonic thickness measurement instruments. Addition of other sensors is also supported.
.PDFPIC -C /home/sudarson/Study/MEDET/Images/magnetic.pdf 6

.bp
.nr PS 14
.NH 2
.nr PS 12
Ultrasonic Robots by Inspection Systems
.[
snake
.]
.PP
These robots are made up of three drive elements which are connected together using flexible folding bellows and of course, one ultrasonic module. Due to their self-propelled construction, the robots don't need to be pushed through the piping. This means they are free to inspect every point along a section of pipe. Data gathered from ultrasonic and camera sensors is immediately available for viewing.
.PDFPIC -C /home/sudarson/Study/MEDET/Images/snake.pdf 6

.bp
.nr PS 16
.NH
.nr PS 12
.XN "Concept Designs"
.PP
The proposed concepts take the best features of pre-existing designs while also trying to propose new features that might be beneficial to pipe inspection. All the robots are rated based on their performance, and the the concept with the most balanced features will be chosen as the best one.
.nr PS 14
.NH 2
.nr PS 12
.XN "Base Bot"
.LP
.B "Single Body  \[bu]  Wheel pressed against wall \[bu] Camera \[bu]  Battery Powered"
.PDFPIC -C "/home/sudarson/Study/MEDET/Images/Single_Assy.pdf" 4.5
.CD
.I
$phi sub 1$ - Retractable spring loaded legs
$phi sub 2$ - Camera for observation
.DE
.EQ C
left [ matrix{
ccol { FR1 above FR2 }
} right ]
~~=~~
left [ matrix{
ccol { X above 0 }
ccol { X above X }
} right ]
~
left [ matrix{
ccol { phi sub 1 above phi sub 2 }
} right ]
.EN
.CD
.I
FR1 - Ability to fit through small pipes
FR2 - Obtaining data about pipe condition
.DE
.PP
This concept was chosen to be extremely simple in order to reduce the number of moving parts and make it more cost effective. The wheel pressed against wall traction design is the easiest to implement, and consists of adjustable spring loaded legs. These can change their size based on the size of pipe, but also put sufficient force on the pipe walls in order to ensure traction is obtained. The Base Bot runs on battery, so its range and the number of sensors that can be attached to it are very limited.
.RS
.SH 2
Advantages
.BL
Small size allows the robot to fit into small pipes.
.BL
Simple construction allows for low cost.
.SH 2
Disadvantages
.BL
Only camera not sufficient enough to inspect pipes thoroughly.
.BL
Wireless signals may not transmit properly through thick walls and deep into pipelines.
.BL
Being battery operated, the robot has a very limited range.
.BL
Unless a retrieval cable is attached to the robot, it is difficult to retrieve it in case the battery fails.
.BL
Rubber wheels provide limited traction.
.RE
.nr PS 14
.NH 2
.nr PS 12
.XN "Lone Wanderer"
.LP
.B "Single Body  \[bu]  Magnetic Wheels \[bu] Camera + UV sensors \[bu] Wired"
.PDFPIC -C "/home/sudarson/Study/MEDET/Images/Single_Assy_Magnetic.pdf" 5.5
.PP
This concept was meant to improve on the Base Bot in a few significant ways - increase traction, increase range, and improve inspection ability. In order to meet these requirements, the Lone Wanderer has magnetic wheels, an extra UV sensor array, and is wired to a power source at all times.
.CD
.I
$phi sub 1$ - Rotation of magnetic wheels in contact with pipe
$phi sub 2$ - Camera and UV sensors for observation
.DE
.EQ C
left [ matrix{
ccol { FR1 above FR2 }
} right ]
~~=~~
left [ matrix{
ccol { X above 0 }
ccol { X above X }
} right ]
~
left [ matrix{
ccol { phi sub 1 above phi sub 2 }
} right ]
.EN
.CD
.I
FR1 - Capable of vertical motion
FR2 - Obtaining data about pipe condition
.DE
.RS
.SH 2
Advantages
.BL
The magnets provide superior traction in pipes that are magnetic in nature.
.BL
The UV sensor helps detect cracks and other signs of material failure that a normal camera might not be able to pick up.
.BL
Having a continuously wired power source gives the robot almost unlimited range - limited only to the weight of the wire that the robot can pull.
.BL
Robot can be retrieved easily using this wire as well.
.SH 2
Disadvantages
.BL
Not all pipes are magnetic. This robot will not work in PVC, brass, or copper pipes.
.BL
Magnetic wheels are significantly more heavy than rubber wheels.  This requires a more powerful motor to operate the robot.
.BL
Magnets may demagnetize when travelling through hot pipes, or near magnetic fields.
.BL
The wheels on this robot will only work well in clean pipes. Any sludge or debris blocking contact of the wheels and pipe surface will result in drastically reduced magnetic attraction.
.RE

.bp
.nr PS 14
.NH 2
.nr PS 12
.XN "The Serpent"
.LP
.B "Multi-Body  \[bu]  Magnetic + Rubber Wheels \[bu] Camera + UV + Infrared Sensors \[bu] Wired"
.PDFPIC -C "/home/sudarson/Study/MEDET/Images/Snake_Mix.pdf" 6.5
.CD
.I
$phi sub 1$ - Rotation of wheels powered by electric motors
$phi sub 2$ - Rotation of links via servo motors
.DE
.EQ C
left [ matrix{
ccol { FR1 above FR2 }
} right ]
~~=~~
left [ matrix{
ccol { X above X }
ccol { 0 above X }
} right ]
~
left [ matrix{
ccol { phi sub 1 above phi sub 2 }
} right ]
.EN
.CD
.I
FR1 - Translational motion through straight pipes
FR2 - Articulation around bends
.DE

.PP
It is a multi-body robot with alternating bodies like the Base Bot and Lone Wanderer joined by rotating universal joints. This mix of magnetized wheels and rubber wheels allows The Serpent to have greater traction than either of the previous concepts. Having multiple bodies is also shown to increase robot stability and traction around bends. This robot also features an added infrared sensor to measure distance.
.RS

.bp
.SH 2
Advantages
.BL
Better traction than both the Base Bot and Lone Wanderer concepts.
.BL
Improved stability and maneuverability through bends.
.BL
Addition of infrared sensors allows the robot to navigate pipes much more smoothly.
.SH 2
Disadvantages
.BL
The Serpent is at least 5 links long, and subsequently ends up being heavy. This increases power draw and affects range, as well as what pipes the robot can travel through.
.BL
Consisting of multiple bodies and universal joints to join them, this robot quickly becomes extremely complex. This also makes the robot expensive to manufacture.
.RE
.nr PS 14
.NH 2
.nr PS 12
.XN "Cyclone"
.LP
.B "Multi-Body  \[bu] Screw / Rubber Wheels \[bu] Camera + UV + Infrared Sensors \[bu] Wired "
.PDFPIC -C "/home/sudarson/Study/MEDET/Images/Screw_Multi-2.pdf" 6

.bp
.CD
.I
$phi sub 1$ - Screw-type motion by forward body
$phi sub 2$ - Rotating universal joint
.DE
.EQ C
left [ matrix{
ccol { FR1 above FR2 }
} right ]
~~=~~
left [ matrix{
ccol { X above 0 }
ccol { 0 above X }
} right ]
~
left [ matrix{
ccol { phi sub 1 above phi sub 2 }
} right ]
.EN
.CD
.I
FR1 - Navigating vertical pipes
FR2 - Articulation around bends
.DE
.PP
Cyclone is a screw-type pipe inspection robot. It consists of two bodies joined by a rotating universal joint. The First body or rotor of the robot continuously rotates while the second body or stator only moves along the axis of the pipe. The wheels on the rotor are angled and make the robot move in a screw-like motion. This concept has incredible traction, and allows the robot to climb vertical pipes with ease.
.RS
.SH 2
Advantages
.BL
Superior traction in vertical or steep pipes.
.BL
Reduced weight, complexity, and cost of manufacturing.
.SH 2
Disadvantages
.BL
Movement is extremely slow.
.BL
Difficult to move through bends
.RE

.bp
.nr PS 14
.NH 2
.nr PS 12
.XN "Super Saiyan"
.LP
.ps 11
.B "Multi-Body  \[bu]  Caterpillar Tracks + Hemi-Wheels \[bu] Camera + UV + Infrared Sensors \[bu] Wired"
.PDFPIC -C /home/sudarson/Study/MEDET/Images/Super_Saiyan_Assy_collapsed.pdf 7
.ps 12
.CD
.I
$phi sub 1$ -  Extension of tracks through scissor-lift mechanism
$phi sub 2$ -  Large surface area of caterpillar tracks along with hemispherical wheels
.DE
.EQ C
left [ matrix{
ccol { FR1 above FR2 }
} right ]
~~=~~
left [ matrix{
ccol { 0 above X }
ccol { X above 0 }
} right ]
~
left [ matrix{
ccol { phi sub 1 above phi sub 2 }
} right ]
.EN
.CD
.I "FR1 - High traction to move through pipes easily"
.I "FR2 - Ability to traverse through pipes of various cross-sectional shapes"
.DE
.PP
This robot aims to get the most traction as possibly by using caterpillar tracks and hemispherical wheels for motion. The large surface area of the caterpillar tracks allows the robot to grip the wall much better than all the previous concepts. The hemispherical wheels on the sides of the tracks give the robot grip in areas where the track may not be able to reach. The Super Saiyan is 2-body robot connected by a rotating universal joint.
.RS
.SH 2
Advantages
.BL
Superior traction in all conditions.
.BL
Can travel through bends easily due to being multi-bodied.
.BL
Large surface area reduces pressure on pipes. The would allow the robot to be used in weak pipe sections such as PVC pipes and all prevent damage to anti-corrosion coatings on the inside of pipes.
.BL
The robot's unique shape allows it to travel through square pipes in addition to round pipes.
.SH 2
Disadvantages
.BL
Design is complex and expensive with lots of moving parts.
.RE
.sp 0.15i
.PDFPIC -C /home/sudarson/Study/MEDET/Images/caterpillar2.pdf 5
.CD
.I
An example of the cross-section shapes that can be traversed
.[
caterpillar
.]
.DE
.bp
.nr PS 16
.NH
.nr PS 12
.XN "Comparison Of Concepts"
.PP
The concepts were compared based on several criteria out of 3 stars. A
.I higher
number of stars in Range, Speed, Maneuverability, Stability, Inspection Ability, and Traction is considered better for these values. Whereas a
.I lower
number of stars in Weight and Cost is considered better for these values. Pre-existing concepts have also been compared alongside our proposed concepts. These are highlighted with a peach background.
.sp 1
.PDFPIC -C /home/sudarson/Study/MEDET/Images/comparison.pdf 7

.bp
.nr PS 16
.NH
.nr PS 12
.XN "Choosing The Best Concept"
.PP
The
.B "Super Saiyan"
robot achieved the highest score in our comparison and was chosen as the best concept. Though this concept is projected to be quite complex and expensive compared to the other concepts, the benefits of using this design easily outweigh the drawbacks. Not only does it have the best traction out of all the rubber based tyre materials, the caterpillar tracks can also be easily magnetized to provide even more traction. The multi-body design of the robot allows it to navigate easily through bends, something which the
.I "Belt Driven and Cone Shaped robot"
.[
caterpillar
.]
had difficulty with. Using a modular body design, more than one of these robots could even be attached end-to-end and used similar to The Serpent concept.
.sp 2
.PDFPIC -C /home/sudarson/Study/MEDET/Images/Super_Saiyan_Assy_expanded.pdf 7
.bp
.PP
Most importantly, the Super Saiyan meets all the Functional Requirements set at the beginning of this project. With an adjustable
.I "scissor-lift"
mechanism, the height of the tracks is adjustable, allowing the robot to travel easily through pipes ranging from 100mm to 175mm in diameter. Articulation through bends is made easy through the multi-body design where each body of the robot is joined together by a rotating universal joint. This robot also supports cameras, lights, UV sensors, and infrared sensors to carry out pipe inspection as thoroughly as possible. Being powered by wire, it has incredible range and can travel deep into pipelines. The weight of the cables trailing behind the robot are much less of a problem for the Super Saiyan because of how good the traction is.
.sp 2
.PDFPIC -C /home/sudarson/Study/MEDET/Images/Super_Saiyan_Assy_collapsed_front.pdf 5
.PDFPIC -C /home/sudarson/Study/MEDET/Images/Super_Saiyan_Assy_expanded_front.pdf 5
.TC
.ds CF
.bp
