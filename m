Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795295112;
	b=VyChAGenGd1XmCZifSirx/Vyu5Kn6ufD7Lp+6sDVcfpmBUxNEX+uaMdA/uaHJxbkFvm+
	 pRxQ8pfUpl9lgpfBWfOs2AvW2AVEsfHhnVoZH5uL89I3WMYjx/AfKuWy1nyzR6QcohjS4
	 vV2U1Q9l4OfmPEPuGJjZRPxvVak6pXviOh7lXYofvaJWMno3vrs/LmqifjHYe2HaypqHl
	 mbPQKHg153JPAftJh1HPQLFyM73AphUlumJ9Eg63VoYkoA6Ng6i4MNHzdFWptyyg/ZPd1
	 RfTJr36Fg1eq0lJkdcZ+YsotTVFk/V+GqEEQPeapBtQ8vzMIaQB1UTUUonc+p+vvWAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795295112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=hOkDAm5C9odfejCA066hItzRaUywPpsZ5Ql9NYpuEuI=;
	b=sfqvcq/OpeAJZ2xB8xK4P74eEibLCCrbDEWk7fgJ/nGuh1aYy6zz7bRAOSilscB1JkpC
	 3FnjmeAiwYf1lhRgtvCbPOfZbd5IRER+RFFtrHvWheDA6F5juGpqnAH7HAUzUuBJ11pVY
	 jHeyX2WCFTXfHxPFwohuyjJz8aoUoyz1lJgu/m3RXWt+wn1ZchGaNkMR3oTXfHw7qY2up
	 15QUGouJdJG57J1ZQumkXuJk21shKksiLBJAZLkW3dhqYp25hatkpe4qTn4IFIjkUmKVU
	 CWWJrRBXr22f51uoHc6sVpeA/RBtrkSn6IU/c3O3h65jHdq+yUNGvrLQ67WCgozrSLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ECwppMr2;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0D2606A688
	for <dmaengine@vger.kernel.org>; Sat, 21 Nov 2026 21:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE0D2606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ECwppMr2
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6aa9606ddadso1365994eaf.0
        for <dmaengine@vger.kernel.org>; Sat, 21 Nov 2026 13:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795295111; x=1795899911; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hOkDAm5C9odfejCA066hItzRaUywPpsZ5Ql9NYpuEuI=;
        b=ECwppMr2iaiCweGgzYOx7H7vE6IhmGHoV4YCRSdYTUoxAbF2pnJ23mtJtPA5l3ixC8
         uKnHiVm8xs1Sc8yiFFwsGqku4NvLIc8D0eNZz+w7Fhq22JSfR4tEY2bIJP2DARGpRqqw
         cqr66VI32gJhgkMcw8ZA/ruQx/1/LddgYcpwqCJibhFP3fTnaa2vcZTElH+xtKUPN4nV
         s+IrnIcv2lBYKzJfsOtRcHECIsE2jNwfh8vyzqO4cyVb4o05sfv11zee1zAPH5xLCGia
         v/Dxl/1ldB1GAj62QQv/3+H3cfkOcRAIwReHn38d7Tfd28sDvM1D8KP+HHYcO3Nd9LSu
         3VJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795295111; x=1795899911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hOkDAm5C9odfejCA066hItzRaUywPpsZ5Ql9NYpuEuI=;
        b=wMi2C2M7z3UKEieptKamkyMCnVsp+EuiEqoovLQEMdwmZjTJvuxpjTDwAb8VpqUE+5
         Z5diezgTJpOLtvmLit1HT+TU/TAj+xHhz/B5KDn74Du2nyuHeyybkG6e6zvlTyFHoZDG
         eMQ6soF+mYJ7j34KoL5yJpKFZO/BJZbF6VGMeL3P5zIKDCRh5tcwd4l4d+XNih/FYmHc
         STmq2BJcAVpzHxH9kqGrbyGUVkvMRMbTQDZKv2U3rqWULorP563S5FKKgFiJsZBXAjLt
         Xdj3q+zP9kITfWo6f9jv2JPv6S2SsbSNAYxqcCSUWFx9QWqluiFKjz9RzhXWDi/5b8i2
         u4pA==
X-Forwarded-Encrypted: i=1; AL+hErE5UjdzdtGtnvzLRj8z4ZklMujUIW/1px6EJFPN+55a8YZwxafL3feLSNTSGcFI6vpCVnDuruZHgSQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wXp2rhqCfSgva1h5+6Nsi0ZocQczsA5PqQJrz/sQ8ws2HBm4A
	V7TIH26/4A4Yts8qDqehtoJPf0ibVjdYPm/CnQR55zOqx704lEfM4xvR
X-Gm-Gg: AZFdTZfxROuoq5+tf6SFG0KkHXqjCRV51aHqatZxgoC1n9lj8dj05IyWXm8gu1Y/wtK
	o4qv3ittx2SjzYbHpTKme38j0fQ2vZkxu5jeJrEKun73dx4UYL5EaF8vTa2rVX0Wo9tILIgFx1S
	u2RveyJKlK78doUCbRtctGGwsXLMJDzLbguZXhfGSl6Q8nZioyy9VeNnb0qShaITKpAdPtoRODT
	bSdtqok+sBX8wTAmkSUprinGlZAluS5qBMrwIpaE0aBwdht5G5rdlnHbRP8JvpvOAmPyzFQWrlu
	TO0/Cy7jOh13Ezi8nSj+newUR4uWniGQWAvoIOhdREti7oCbpLH+37FMzmdmTTTRVWaPx3TEF3r
	SCWxE/fKJFR7G37sP6v9mLUHt21zRCdDJD1noRJKqldJKDpXXKSqkpDCMN3HN1nLS/OaYF/huiL
	UZ5uQoKNI1k1cITvTLND3zHUfM6ZJhOpHpYjclNHBGGY1kRbr9T+O3svoDmw4kKC3Wz/eHzc8Xa
	BZLe4WJSAlILNhM+MmEjROg7uNF/7cib7iLld3gbOjM3kZkdg9koat8cvGsBV65nbnihiF6HYIG
	/Hl09SJVdaK8W6mvlnu3NPDY6Z6SLWYKSjJiY7DIr0i9OZ++/VFPTg4hNjnJKD6zC+XyiChxNIE
	5iJVIzPWvSBjjI/n+w19J5+79kcqrVkRw7AQLex/uCQN+ZgeS9NEbtgw1JxR1138QacVPS4QbIt
	y5cGzuekimpfXJ+WS32IAlhwUoET6UTEo1cF6et6howZj5p6872MZz
X-Received: by 2002:a05:6820:f021:b0:71b:1715:7ce1 with SMTP id 006d021491bc7-71b39043d0dmr6285699eaf.0.1795295110819;
        Sat, 21 Nov 2026 13:05:10 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e4a6dsm4635728eaf.13.2026.11.21.13.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:05:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 21 Nov 2026 14:03:20 -0700
Subject: [PATCH v12 5/7] dmaengine: dw: extract hardware-LLP residue
 calculation
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
Message-Id: <20261121-submit-dw-dma-synchronize-v1-v12-5-f51eb635209d@gmail.com>
References: <20261121-submit-dw-dma-synchronize-v1-v12-0-f51eb635209d@gmail.com>
In-Reply-To: <20261121-submit-dw-dma-synchronize-v1-v12-0-f51eb635209d@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Dan Williams <djbw@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

From: Serge Semin <fancer.lancer@gmail.com>

Move the hardware-LLP residue calculation into
dwc_get_hard_llp_desc_residue() so it can be reused independently of
completion handling.

Keep the scanner's LLP snapshot, descriptor updates and early returns
unchanged. Only one transaction is active, so the helper updates its
cached residue directly without reporting a completion indication.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
[james: extract the calculation for the single active virt-dma transaction]
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 42 +++++++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index d00d0d53f6ba..150823544f40 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -281,6 +281,30 @@ static inline u32 dwc_get_sent(struct dw_dma_chan *dwc)
 	return dw->block2bytes(dwc, ctlhi, ctllo >> 4 & 7);
 }
 
+static void dwc_get_hard_llp_desc_residue(struct dw_dma_chan *dwc,
+					  struct dw_desc *desc, dma_addr_t llp)
+{
+	struct dw_desc *child;
+
+	desc->residue = desc->total_len;
+	if (desc->vd.tx.phys == DWC_LLP_LOC(llp))
+		return;
+
+	if (lli_read(desc, llp) == llp) {
+		desc->residue -= dwc_get_sent(dwc);
+		return;
+	}
+
+	desc->residue -= desc->len;
+	list_for_each_entry(child, &desc->tx_list, vd.node) {
+		if (lli_read(child, llp) == llp) {
+			desc->residue -= dwc_get_sent(dwc);
+			return;
+		}
+		desc->residue -= child->len;
+	}
+}
+
 static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 {
 	struct dw_desc *desc;
@@ -338,23 +362,7 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	if (!desc || test_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags))
 		return;
 
-	desc->residue = desc->total_len;
-	if (desc->vd.tx.phys == DWC_LLP_LOC(llp))
-		return;
-
-	if (lli_read(desc, llp) == llp) {
-		desc->residue -= dwc_get_sent(dwc);
-		return;
-	}
-
-	desc->residue -= desc->len;
-	list_for_each_entry(child, &desc->tx_list, vd.node) {
-		if (lli_read(child, llp) == llp) {
-			desc->residue -= dwc_get_sent(dwc);
-			return;
-		}
-		desc->residue -= child->len;
-	}
+	dwc_get_hard_llp_desc_residue(dwc, desc, llp);
 }
 
 static inline void dwc_dump_lli(struct dw_dma_chan *dwc, struct dw_desc *desc)

-- 
2.53.0

