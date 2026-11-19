Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104113;
	b=E8YN+1xUj6VDcxUDyDlMXUi2nzQjaycedoFVfdqBMosC/UamQrBoBOpmw/IVkS0OnYg2
	 Ec0VRT6o6qgm87Ffu8A8TNzoVyNpos+9Ci7tBaWC4iNWcJRHTb0hd8POA7xUrJzYFSa08
	 3u0+Bak9hMNWjUKLsTzkbMMC05Ew5JLiDEMPssZvIq20+xtqYMJuqRbcUXpXXhUp7jou/
	 fq8sh2Qlyss5eVRo7WQh3vQJ2edsg3qqWihmGADk/WRQLlg/6NFr1bsd92b++aBdQRR/i
	 ZyPJWG8ekjxSuWnmur1yzFTIKAxC4epwRKWSCQr6NOfzjgVFn7jCwAPpgGnyds1/KRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=euvHppXysFAeHymgmyGNBpfWO5+extXbAkR04f6pvro=;
	b=IxNsGDT7/QcrDlAGRy36y6IOeYoTzUSpHAGPxj0kpmlmNDTxc+3MQtG0Z9Hu7+yRekmW
	 0mni5DBPcT9aE47ridYIFmaUFb25BqxdGJ3gGZKv6lKlCsbWa5mBaJJEFxWdJ/+dTAwOV
	 35quYNfUO+M6/YMf+6KUHLX9vZ8xPazbCqkNdiIrLn1ea13moFwm6CaAwrpllrAHvTz0C
	 vC/fV5HJXCgWq9YKBKzIm85cA/Ez5oIjPjr/Au5GqNyEA4GDMT/kbPyO75GP4dMx4ljlT
	 nkDwtdz0TT/l5geK1O6hl0TR9HHRbQKDNyS/d8TE+FhcfuU6/8wMoOQy/rRu9fHCP2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wGGCd2Ez;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBD860A262C
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 16:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CBD860A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wGGCd2Ez
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b4e04eda5aso20840547b3.1
        for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 08:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795104112; x=1795708912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=euvHppXysFAeHymgmyGNBpfWO5+extXbAkR04f6pvro=;
        b=wGGCd2Ezptp6rVA3z5qs/3fWDsqW4j4+oLPC3dAsD7hPn4cCzRq/EeiC0pV4Njb/3N
         Mse44Gw9BhKCfppcVj+8Brl/wgbxhJCzEkb7VH6wa0gE8JEU3QWrVNkMk1uNDX+kvPQU
         LbcNymDnne8iPNHsIkk4qGvsLOQ0LLbeZXsHSPhEP9B8hgd/QhpwBm1tjUDpNlnXPZeY
         pp3XkIQYbAW7zKbqQRmClC7UdzxmfBSGH0ZnwisIlquPSCwBVwA4tOlsl5Qu8r7SuGUJ
         8dg2R+NG666Q618FSy3JvNORiC7Qw1G8x4Oe1+UDXFjCmyrWIzAsWdMvXDCx0gcpFyfe
         FTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104112; x=1795708912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=euvHppXysFAeHymgmyGNBpfWO5+extXbAkR04f6pvro=;
        b=DJYa6oJTWdnk5n7XLz3rQf8FLL6Rko+6EZ883OoTy6hLnYEQ777Tek20ENJ5R9FepG
         QEq3D2hd8YruJ4XyYt3NEBjaae9i0pJPeaSr/uTKkfJipJTpx2nv08WZ/pD6hHHsy9mb
         YsKZ3pkevpYlnROSppuvlsAudVpv16SyVsOkv6EfKI9Jv7a5sM6yVlnZa/oCts4BTWPC
         02/IRGWzvKJwvvPzDWn8TPCTzsdnSt2BLmj7vvX52ITd2bucqkIfCTpYLP3fLyfqJd4o
         xbYCdcafY6BGylUFD4RaHIT1+3AfA30HT/GfQBbOZBytu+qjw2m8DAzpeUqnSNaDNOk1
         IHeA==
X-Forwarded-Encrypted: i=1; AL+hErH3XyqmXhOBr4aSliVkOmMm9X/v6QLD52+aq+I3bpALG/QzAzQ54prWQcSCMCxhJtVfXWE9OmP5cm8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/38X/bcQnqqiVzJuHtMU2wlP9dPdnMlj7o3YUwN52y5lUQF1cA
	VYaqthVrcE+oGY08qZrox6vWwz76Ko+LUaaskohy1Y7sW/d1yIx+1ucU
X-Gm-Gg: AZFdTZfUqP0Kck04/t6rfbCHMmMmSfS+C40BhITHY9bhCW5hieUXC5uwGL4houqfmv8
	S2fxPrvHCrqnHVp3yyyzFHQjZJovFGwfk3XyFq84RNDBFKdn0D1TeQkYofUpjUHzJdC2T7WaUV8
	4pAYz+fvkSpOxsa1NDoTjslR43D54Ixltp7qMvrsiDmZBcbyR3Q4krw4o9OkNZLt66wJbddf4iA
	QzF1WhTJU1WewggjgnInQ2wiKm9GRWeMbDiHiEDiMdY5mPP5rV1phl6+JG87h+oQfpC7ghDNrNh
	u59BFwFriDMav5g5n6ZVDhdAmGwbaNkMIiqMfwyV+r3YDjl5ql3hH+XpFqQ3GXGtiTNoSMTO2Qn
	KpYdjajK0nfaz7ww3BkWgReHOQIHyAABIwUvDeMPprs8xJohgm5jH6Vz06+mTA2g+ZnQrN7yPd7
	2a6CG9ROqs1Cm/f5S4Sw4y+G0GY086oL3RiaA1V1AuE5PR2Zg1ikWD19OJEHqTR2QXzTGf4CVJa
	6TUdmHSNqiCOt1aQWB4/rZdVAZW0N6eI2afM05C0dm780VT67ofbca9eqhLoMMJSsV6JFJ423l3
	TBjQRoD7J8wH97rNEbalrarTPmAZFyT0hTdy6mJtnwXGYAy4t1JZC92z3kmfp/bZE99gTTQNV0N
	E6J9DoWtsNHoYrcuFbXQ5QKlAi9Umwa4i6OHCXIVR07qG2P3+0Y+6vOnVpSnRgaqyVqPX8oAK0u
	dC+z9RXQXZNHam0Hi5G3DBfN87ELnCzOLV8K2Ag98c5aorcoLgaU8=
X-Received: by 2002:a05:690c:31e:b0:8b1:7072:a61b with SMTP id 00721157ae682-8b520496861mr836737b3.22.1795104111812;
        Thu, 19 Nov 2026 08:01:51 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52031aa4bsm623267b3.34.2026.11.19.08.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:01:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 09:00:59 -0700
Subject: [PATCH v8 4/9] dmaengine: dw-axi-dmac: use atomic polling for
 suspend acknowledgment
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-4-f8e7fe60594c@gmail.com>
References: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
In-Reply-To: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>, Baruch Siach <baruch@tkos.co.il>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.17-dev

The pause loop delays after its final status read, so an acknowledgment
that arrives during that delay is cleared without being observed and
the caller receives -EAGAIN.

Use read_poll_timeout_atomic() to check the status after the final delay.
Keep the two-microsecond polling interval, 40-microsecond timeout and
-EAGAIN return value when suspension is not acknowledged.

Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index def591fc75ce..8c115d20728b 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1219,7 +1219,8 @@ static int dma_chan_pause(struct dma_chan *dchan)
 {
 	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
 	unsigned long flags;
-	unsigned int timeout = 20; /* timeout iterations */
+	u32 status;
+	int ret;
 	u64 val;
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
@@ -1250,12 +1251,9 @@ static int dma_chan_pause(struct dma_chan *dchan)
 		}
 	}
 
-	do  {
-		if (axi_chan_irq_read(chan) & DWAXIDMAC_IRQ_SUSPENDED)
-			break;
-
-		udelay(2);
-	} while (--timeout);
+	ret = read_poll_timeout_atomic(axi_chan_irq_read, status,
+				       status & DWAXIDMAC_IRQ_SUSPENDED,
+				       2, 40, false, chan);
 
 	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
 
@@ -1263,7 +1261,7 @@ static int dma_chan_pause(struct dma_chan *dchan)
 
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
-	return timeout ? 0 : -EAGAIN;
+	return ret ? -EAGAIN : 0;
 }
 
 /* Called in chan locked context */

-- 
2.53.0

