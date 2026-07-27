Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E72842A7BA
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184823; cv=none; b=XCBOrGXMwCZSz1MnCS2w4Qml+lYEO+cARoN1z+kNHpvDAyrWAYFW6auO+syCZ/l2zOvqvT0slV126SierCEQa2SDCzq/HoshG6mvsO2bpWq5R5cHX/xtaCr1mLE913AHD5k1lLlaVAupMnNsMQXP8ASsoRi6nA0gH1SaCasozYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184823; c=relaxed/simple;
	bh=dPrUZ9npC262RIg0Uw7vmB/XmygUavJcgRiB+5iJiqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hxiLqbGz/w/61IEO0KEXKOLE1uQPspnPdveMilAh3aKfZoDdQOEGDGNJHUABrWlb2/HteWqC5DDQrb5CDob4cIBu7JO9dViH5+a0ykj9r/0bCGDr4WbrNWAptafuHTZhkHZBEEZR72zBIHzJXNTZiboajot63XyCfOeP/mPzjaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rt3f1BV+; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rt3f1BV+"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so2190326b3a.1
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184822; x=1785789622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JfQfOldSFPXOViGrgsXcllkedO7V2dbH1YA4jan0wi4=;
        b=Rt3f1BV+4THNnBr28qT+9Z0GwVP5pAEABUdPKgH/7qIgdwbuNQ78WKF0SPMUoC7AQa
         rrklte3O7a7/vvj2AEoF7uLRKby92XPnomBup/wL04Jg6fk4H1YPe/S9O6DBYWoWhIZS
         Suo1P/uf7+CHFWOFwwx9HCCLq6xqjIn9SBT0IEJEznd/TrXTotRLKQK+5AWarzrPCzNn
         cxAvL+n0QCJFCgPlmDfLaEVDoJ8uKdPJalKegRf0xDUywJwiRZCmpGPwn4ORlQPETzi5
         fWwQLX1/eGFyvG9QGb65QyAOBuTlF7qWYISbFzk1yoR9pVGzmIoqlInpqlu7Vr+MgEUI
         nojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184822; x=1785789622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JfQfOldSFPXOViGrgsXcllkedO7V2dbH1YA4jan0wi4=;
        b=nW18mAAB5DHKxxwwXHboVGCdY5L42+9yHk/BsiUFf4QI96D9Ox1KacB7tSDnBsI1Ws
         woiAVJWI9gG0lB92SIA58wfZagn5LSKydx1WW3uSEznMy3yq0/ZrcHqChAnmqlR4vMkE
         gVyzhI0g7IhjVERGPKIFlKoeHhGGXLyLdkiqwydVqPeWNh3cFi9CL6mnY9blslFnZymR
         lc+sVSYNsvBSxXlfzfIIUKxWTM4uVThhwDjrPry/f0wK99/4OB4lXrj0W+cgZZT/1Ixu
         q5F2HhuCKs/3KEsSpbDEstPoNVPhyWEnYvDYmOeWNmLsxfifzuu2LAsV3w5eJJWyZeru
         uOfw==
X-Forwarded-Encrypted: i=1; AHgh+RpgzC4fwEnyoRj/4MoT7EunyX+d1YdV8ICxEsONsoVVRYdhdNEQJnLkpJgNH39EyaFH5zcSkcQ92PQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb9Emp5+qPTAvrbohsywB5D/VXxhOhEI7KpD6XlqUo+Vi0o+3d
	sCWNEQ2TyNqZ15WXMUAF5S0XL86jyw6vuOle4NWRSwUJNa8/ylPL3ScNelC/IQ==
X-Gm-Gg: AR+sD13ySZdanheLVasCYJ/tYdNFRJcjv9HcO81Kll73kezzNLgBji8zaKVBr+pnGUL
	ADJk6dCoLMASXbVuth6RUoGgwA5CvhttTYP+N3OyVlYSOTsz2f8zsbTnyrJuZwsizXsLGymUbpZ
	cYEtCIH9kSGxwxIUElM5lXXGPPKbTo9e6dBfxzIp2jITRnj6/FvSdNYptr8ud6Yobxp3fYs94jQ
	73Qm1Ob4wELIQdyUxcFt9Eebqfvjo+bubj/w1Mp4G6iszfEphkShus+d8wGhUjalZHUE2vbNS4Y
	P6EHhs1+6uf1ePUtFKe2F0hkybtPwynJK8+LWLVHwIAPYtTuWztFpG99t1fbUftn4jFY7xJ7kGt
	PaXhPR3r4J90eyyIBo5pzeaTUtsXiL5VKufSWswkjlMDhdp4I6NOmfGHX56TmUWppG5lMEiSxLO
	pOSK+X
X-Received: by 2002:a05:6a00:1249:b0:84a:2fc1:da38 with SMTP id d2e1a72fcca58-84e59574807mr7367623b3a.58.1785184821748;
        Mon, 27 Jul 2026 13:40:21 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:40:21 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 43/64] dmaengine: pxa_dma: kill vchan BH on teardown
Date: Mon, 27 Jul 2026 13:39:05 -0700
Message-ID: <df261bff5e82b39bce1b6a93e7c0ffac21c33dd3.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use dma_chan_kill_bh() for virt-dma cleanup.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/pxa_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/pxa_dma.c b/drivers/dma/pxa_dma.c
index fa2ee0b3e09f..d57e5e0c422c 100644
--- a/drivers/dma/pxa_dma.c
+++ b/drivers/dma/pxa_dma.c
@@ -1215,7 +1215,7 @@ static void pxad_free_channels(struct dma_device *dmadev)
 	list_for_each_entry_safe(c, cn, &dmadev->channels,
 				 vc.chan.device_node) {
 		list_del(&c->vc.chan.device_node);
-		tasklet_kill(&c->vc.task);
+		dma_chan_kill_bh(&c->vc.chan);
 	}
 }
 
-- 
2.43.0

