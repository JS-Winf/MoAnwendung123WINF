#ifndef FLUTTER_hotshopLICATION_H_
#define FLUTTER_hotshopLICATION_H_

#include <gtk/gtk.h>

G_DECLARE_FINAL_TYPE(MyApplication, hotshoplication, MY, APPLICATION,
                     GtkApplication)

/**
 * hotshoplication_new:
 *
 * Creates a new Flutter-based application.
 *
 * Returns: a new #MyApplication.
 */
MyApplication* hotshoplication_new();

#endif  // FLUTTER_hotshopLICATION_H_
