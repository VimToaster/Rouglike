// If not moving, listen for input
if (!moving) {
    if (keyboard_check_pressed(vk_up)) {
        target_y -= tile_size;
        moving = true;
    }
    else if (keyboard_check_pressed(vk_down)) {
        target_y += tile_size;
        moving = true;
    }
    else if (keyboard_check_pressed(vk_left)) {
        target_x -= tile_size;
        moving = true;
    }
    else if (keyboard_check_pressed(vk_right)) {
        target_x += tile_size;
        moving = true;
    }
}

// Smooth movement towards target position
if (moving) {
    // Move horizontally
    if (x < target_x) {
        x += min(speed, target_x - x);
    } 
    else if (x > target_x) {
        x -= min(speed, x - target_x);
    }
    
    // Move vertically
    if (y < target_y) {
        y += min(speed, target_y - y);
    } 
    else if (y > target_y) {
        y -= min(speed, y - target_y);
    }

    // Snap to the target position when close enough
    if (x == target_x && y == target_y) {
        moving = false;
    }
}
