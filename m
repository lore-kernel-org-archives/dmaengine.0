Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: dmaengine: at_hdmac: fix memory leak in at_dma_xlate()
From: Vinod Koul <vkoul@kernel.org>
Message-Id: <20181129142054.GH3175@vkoul-mobl.Dlink>
Date: Thu, 29 Nov 2018 19:50:55 +0530
To: Richard Genoud <richard.genoud@gmail.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>, Dan Williams <dan.j.williams@intel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Mario Forner <m.forner@be4energy.com>, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, stable@vger.kernel.org
List-ID: <dmaengine.vger.kernel.org>

T24gMjctMTEtMTgsIDE3OjA2LCBSaWNoYXJkIEdlbm91ZCB3cm90ZToKPiBUaGUgbGVhayB3YXMg
Zm91bmQgd2hlbiBvcGVuaW5nL2Nsb3NpbmcgYSBzZXJpYWwgcG9ydCBhIGdyZWF0IG51bWJlciBv
Zgo+IHRpbWUsIGluY3JlYXNpbmcga21hbGxvYy0zMiBpbiBzbGFiaW5mby4KPiAKPiBFYWNoIHRp
bWUgdGhlIHBvcnQgd2FzIG9wZW5lZCwgZG1hX3JlcXVlc3Rfc2xhdmVfY2hhbm5lbCgpIHdhcyBj
YWxsZWQuCj4gVGhlbiwgaW4gYXRfZG1hX3hsYXRlKCksIGF0c2xhdmUgd2FzIGFsbG9jYXRlZCB3
aXRoIGRldm1fa3phbGxvYygpIGFuZAo+IG5ldmVyIGZyZWVkLiAoV2VsbCwgaXQgd2FzIGZyZWUg
YXQgbW9kdWxlIHVubG9hZCwgYnV0IHRoYXQncyBub3Qgd2hhdCB3ZQo+IHdhbnQpLgo+IFNvLCBo
ZXJlLCBremFsbG9jIGlzIG1vcmUgc3VpdGVkIGZvciB0aGUgam9iIHNpbmNlIGl0IGhhcyB0byBi
ZSBmcmVlZCBpbgo+IGF0Y19mcmVlX2NoYW5fcmVzb3VyY2VzKCkuCgpBcHBsaWVkLCB0aGFua3MK
