Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,4/6] ACPI / bus: Rename acpi_get_match_data() to acpi_device_get_match_data()
From: "Rafael J. Wysocki" <rafael@kernel.org>
Message-Id: <CAJZ5v0hssSqBDE8emBqKFQn9gXK1dBJwB4L0y=M5===YUXjTbQ@mail.gmail.com>
Date: Sun, 4 Feb 2018 08:23:05 +0100
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: dmaengine <dmaengine@vger.kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Sinan Kaya <okaya@codeaurora.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Vinod Koul <vinod.koul@intel.com>
List-ID: <dmaengine.vger.kernel.org>

T24gVGh1LCBGZWIgMSwgMjAxOCBhdCA5OjIwIFBNLCBBbmR5IFNoZXZjaGVua28KPGFuZHJpeS5z
aGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gRG8gdGhlIHJlbmFtaW5nIHRvIGJl
IGNvbnNpc3RlbnQgd2l0aCBpdHMgc2libGluZywgaS5lLgo+IG9mX2RldmljZV9nZXRfbWF0Y2hf
ZGF0YSgpLgo+Cj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4KPiBGaXhlczogODAyMTJhMTYyMzI5
ICgiQUNQSSAvIGJ1czogSW50cm9kdWNlIGFjcGlfZ2V0X21hdGNoX2RhdGEoKSBmdW5jdGlvbiIp
Cj4gRml4ZXM6IDE0NmI0ZGJiMGVlZiAoIkFDUEk6IHByb3BlcnRpZXM6IEltcGxlbWVudCBnZXRf
bWF0Y2hfZGF0YSgpIGNhbGxiYWNrIikKCldoeSBhcmUgeW91IGFkZGluZyB0aGUgRml4ZXM6IHRh
Z3MgdG8gYSBwYXRjaCB0aGF0IGRvZXNuJ3QgbWFrZSBhbnkKZnVuY3Rpb25hbCBjaGFuZ2VzPwoK
V2hhdCBhcmUgdGhleSB1c2VmdWwgZm9yPwotLS0KVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGxp
c3Q6IHNlbmQgdGhlIGxpbmUgInVuc3Vic2NyaWJlIGRtYWVuZ2luZSIgaW4KdGhlIGJvZHkgb2Yg
YSBtZXNzYWdlIHRvIG1ham9yZG9tb0B2Z2VyLmtlcm5lbC5vcmcKTW9yZSBtYWpvcmRvbW8gaW5m
byBhdCAgaHR0cDovL3ZnZXIua2VybmVsLm9yZy9tYWpvcmRvbW8taW5mby5odG1sCg==
