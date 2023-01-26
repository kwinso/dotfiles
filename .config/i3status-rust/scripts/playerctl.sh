#!/bin/bash

echo -n $(playerctl metadata --format '{{artist}} - {{title}}')
