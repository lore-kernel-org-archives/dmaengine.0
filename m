Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [2/8] dmaengine: shdmac: Change platform check to CONFIG_ARCH_RENESAS
From: Simon Horman <horms@verge.net.au>
Message-Id: <20180423075338.riknxyjugnv5grjb@verge.net.au>
Date: Mon, 23 Apr 2018 09:53:39 +0200
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vinod.koul@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "David S . Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, linux-media@vger.kernel.org, netdev@vger.kernel.org, devel@driverdev.osuosl.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-ID: <dmaengine.vger.kernel.org>

T24gRnJpLCBBcHIgMjAsIDIwMTggYXQgMDM6Mjg6MjhQTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+IFNpbmNlIGNvbW1pdCA5YjViYTBkZjRlYTRmOTQwICgiQVJNOiBzaG1vYmls
ZTogSW50cm9kdWNlIEFSQ0hfUkVORVNBUyIpCj4gaXMgQ09ORklHX0FSQ0hfUkVORVNBUyBhIG1v
cmUgYXBwcm9wcmlhdGUgcGxhdGZvcm0gY2hlY2sgdGhhbiB0aGUgbGVnYWN5Cj4gQ09ORklHX0FS
Q0hfU0hNT0JJTEUsIGhlbmNlIHVzZSB0aGUgZm9ybWVyLgo+IAo+IFJlbmVzYXMgU3VwZXJIIFNI
LU1vYmlsZSBTb0NzIGFyZSBzdGlsbCBjb3ZlcmVkIGJ5IHRoZSBDT05GSUdfQ1BVX1NINAo+IGNo
ZWNrLCBqdXN0IGxpa2UgYmVmb3JlIHN1cHBvcnQgZm9yIFJlbmVzYXMgQVJNIFNvQ3Mgd2FzIGFk
ZGVkLgo+IAo+IEluc3RlYWQgb2YgYmxpbmRseSBjaGFuZ2luZyBhbGwgdGhlICNpZmRlZnMsIHN3
aXRjaCB0aGUgbWFpbiBjb2RlIGJsb2NrCj4gaW4gc2hfZG1hZV9wcm9iZSgpIHRvIElTX0VOQUJM
RUQoKSwgYXMgdGhpcyBhbGxvd3MgdG8gcmVtb3ZlIGFsbCB0aGUKPiByZW1haW5pbmcgI2lmZGVm
cy4KPiAKPiBUaGlzIHdpbGwgYWxsb3cgdG8gZHJvcCBBUkNIX1NITU9CSUxFIG9uIEFSTSBpbiB0
aGUgbmVhciBmdXR1cmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxn
ZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KClJldmlld2VkLWJ5OiBTaW1vbiBIb3JtYW4gPGhvcm1z
K3JlbmVzYXNAdmVyZ2UubmV0LmF1PgotLS0KVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGxpc3Q6
IHNlbmQgdGhlIGxpbmUgInVuc3Vic2NyaWJlIGRtYWVuZ2luZSIgaW4KdGhlIGJvZHkgb2YgYSBt
ZXNzYWdlIHRvIG1ham9yZG9tb0B2Z2VyLmtlcm5lbC5vcmcKTW9yZSBtYWpvcmRvbW8gaW5mbyBh
dCAgaHR0cDovL3ZnZXIua2VybmVsLm9yZy9tYWpvcmRvbW8taW5mby5odG1sCg==
