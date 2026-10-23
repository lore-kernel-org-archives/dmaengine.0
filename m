Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792742997;
	b=ODpyvRK8j9MXZvCfCE1wIyUk9PZ4UYN4G191+u10MGnt3HMg5sPzBoDS3SPeZNCKqTtI
	 61zuxSjcZ/wnx1LNU/LKPPNHiljRoY2fXOB6vEo3B7oqThlA20nN9cbAl7/SpNOwdOWt2
	 7GXXMnctmSwanIPH3IFcGJfr10dP4VJhdiuhT/sVuavV7H5tJ01WR47mjZUazP1uNG70t
	 wa41Qf6xG6Ftd17jtMs6xtE+rPWuYCc6Bot0nzUr5yW62k6gCENILTjsELIxo8VGQj6Os
	 2cFmlANT+aHTNoh79MxHRa6QeTs4Gw/WBYuYwMWoQ+CDYk1PG6X6i7QLDOoYyk72+TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PydVMHArz0TUuVCof4/KPrJGkSdN7KAo4OoEVIb5fy8=;
	b=uMesXODNUDhRat3haW2uy9SNf+H4u/zr8GNVhRD1X+haD4kXjOrJoE0p37lX1ArNtrZd
	 Zt2n6oXsJn0LUrU3PZLgFOA3kMrMFqdhGc+OXP2gQqKKtWzEWO11QFHrAtrtFWizV2/hc
	 NBuyC4bUU10mkRbZB8CuRUKpxPLNkUl+Yr07NNxp14jYAVC9XArhKKVmyZcnJmB0MwM77
	 PjuWEE2SQg0jZN6P8NsFmemT+TpOmfmB+c0NcmJxM7DJyBn4+HjKzKXRaDKak9LERLGJK
	 ukUVFlwsp94yeq1XMUO3EGcAoc/fuw0cittnqPX9BcJDqTzVuQ90awOldHHxqLLOjsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b="kXE9su/X";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7E3606A31D
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 08:09:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB7E3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=kXE9su/X
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4956869750eso3659045e9.2
        for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 01:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792742995; x=1793347795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PydVMHArz0TUuVCof4/KPrJGkSdN7KAo4OoEVIb5fy8=;
        b=kXE9su/XrilHaMKHCZIVTSdlDgafpj4k8kcjJWY97ikZ6FAKv8qH/jtWzp+Uv6eGiy
         G1cJGlVl6/XQpDeWDN9vHzYUzXzKM4zZlRcKCAvcz4pquWFVY2cFjMUGExIoZllY6XyH
         BVyfkcu2JSiFuSq1KcSAs5frWzt5QQRYvG4goHN4LzhTNc9YKMrbSkRBASZBwkmM7/Zx
         bvH6hk5WznqLWYmqUlW/8LBf55c6LEbGe4YHsQDRHhxhVd8vr3jI9/NTQ+XOFo7ULSNS
         PHGoCtvALIZEvKYcq6IZ7ncDbvIdmP6iJNSIM4HbWlV7ldcVXWYVZLljeItOkYCmsPux
         /hbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742995; x=1793347795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PydVMHArz0TUuVCof4/KPrJGkSdN7KAo4OoEVIb5fy8=;
        b=0szeZ7NSTbLPri3lf9BSVnWhPEHhUby5TmUOEVADIOn1DHq7RuzG+VEmm26msLY/Ot
         E9V2VE3BzzPO7Lc61tG4QiSYljBjnawGl95GOMHEnwBTFu0l7xqRh6da7DvbgbcfUeK3
         v/fuMziFy/y4Jzp9wQXqAb2yCeu3BiwqfqZEKN6HFucNVZYsfQtlsecEK1i2fmnsSbqa
         fSP6WOAb5XXWckFTd0nZ90qI3Dcc6SIwjU8BZqoyW18mtpYxd1dwS5qfIX2/Io8YwL+v
         Ti/1JnkqaQWPtxRtMu0FXSIqc6cz1TEaQTJYS1GFD3GWZrNblKLIfmvl1LY1bOyVBdwZ
         5a2w==
X-Forwarded-Encrypted: i=1; AKwUvBzveet8Y9usYsbzlY1wuoEjt6+zJseDliOwM6cIqfPBCU0WZwL7GQwJ9iJprrbaYJ0Z6Q8FAw9rVzo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIf/ukQpGkNZ6js2SuP+/JMfw/Z18Iz6Zzy5iaoHXlPkrR/jtwD
	IAWDp3iY61rRiMOEAIqWkOSqkZ8tLQBElayz/0DM9/c6GuLAu1B3/Tbcu5bkrpSkXsI=
X-Gm-Gg: AYBFou3HBWbg41dYZCCK5enfp8aqdh/zq//MdNkry20z+3SI3S/EJqMUJVP+Kqt/gId
	lkrKWp859Br9RB9GvyjMogdcFe0k4x8ZdyDy2uqMltnwYa8ltz5ZOMPT6Xopa4+u3UsbCwsj4mA
	5ouciBPJuJjyN84+TFMiW0DYMhkrPWPFnmS1Kl62HtBtdpT8VmLBWEHjECCKupA7DciV0ojRAc+
	g4cZFOD1LlYHHNv/LizSAV53GOgQvag+0T0KM3NLFFmqmUthCFNV5t7cx0mg09jQWFrdqcyczf6
	c5jBOg8On40C11KrmjjBRYPondqJuXr+xDadKhOOXSOZaHFVYclTKrNSEyHIUF0GPStBEj5JWz/
	971qj2cb/xQIWDw2buKDELR2TP0BB9dBCqJgROpoePGwew5n/wvunlZ5rOuI4TROxS0WDFHUfCz
	tR8UBArvYBndSJhnpXUsrm/9t8pibYAZqm0aksqsGMqsYsbYYBzSFV8wzbamtT5yibJD0l0ADAi
	uV2UkrYfe5vuGPFTq1yMXkFTFI1peQpBguU19usovsuuNhiyCJAbWjUh0oCsY/XixIOWddML5zk
	IwWtL1TU4UW40C4rOdal4aEg0dGicIIlHA==
X-Received: by 2002:a05:600c:608c:b0:4a2:167a:c939 with SMTP id 5b1f17b1804b1-4a2167acd9bmr9976075e9.21.1792742995238;
        Fri, 23 Oct 2026 01:09:55 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:6877:44a0:5297:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2153c1b7csm18493655e9.1.2026.10.23.01.09.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 01:09:54 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Vinod Koul <vkoul@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>,
	stable@vger.kernel.org
Subject: [PATCH] dmaengine: dma-jz4780: Fix NULL dereference in tx_status after terminate
Date: Fri, 23 Oct 2026 10:09:53 +0200
Message-ID: <20261023080953.16963-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

jz4780_dma_terminate_all() sets jzchan->desc to NULL. The cookie of a
cyclic transfer never completes, so a later jz4780_dma_tx_status() call
with that cookie finds no descriptor on the channel's lists, takes the
else branch and reads jzchan->desc->vdesc.tx.cookie through the NULL
pointer.

The driver has always allowed this, but it only shows once something
calls tx_status() on a terminated cyclic channel, as
snd_dmaengine_pcm_sync_stop() does since commit 88e98af9f4b5 ("ALSA:
pcm_dmaengine: Don't synchronize DMA channel when DMA is paused").
Closing a playback stream then oopses:

  epc : jz4780_dma_tx_status+0x184/0x210
  Call Trace:
  [<8048e104>] jz4780_dma_tx_status+0x184/0x210
  [<805804d8>] snd_dmaengine_pcm_sync_stop+0x4c/0x94
  [<8058f068>] snd_soc_pcm_component_sync_stop+0x80/0xc0
  [<805775b8>] do_hw_free+0x20/0x6c
  [<80577650>] snd_pcm_release_substream+0x4c/0x9c
  [<805781ac>] snd_pcm_release+0x48/0x9c

Only compare the cookie with the current descriptor's when there is one.

Fixes: d894fc6046fe ("dmaengine: jz4780: add driver for the Ingenic JZ4780 DMA controller")
Cc: stable@vger.kernel.org
Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
Apologies to the stable list: two copies of this patch reached it earlier
today from test sends, with the Cc trailer still in place. Please ignore
those. This is the real submission, and it is the same patch.

Seen on an Ingenic X1600 (HiBy R1, compatible "ingenic,x1830-dma" as
fallback) on v7.3; the code is shared by all the SoCs this driver
supports. The patch is build-tested on 734bef548a96 (v7.3-7363).

 drivers/dma/dma-jz4780.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
index 6070dfdb7114..7f827be502f1 100644
--- a/drivers/dma/dma-jz4780.c
+++ b/drivers/dma/dma-jz4780.c
@@ -658,7 +658,7 @@ static enum dma_status jz4780_dma_tx_status(struct dma_chan *chan,
 		/* On the issued list, so hasn't been processed yet */
 		residue = jz4780_dma_desc_residue(jzchan,
 					to_jz4780_dma_desc(vdesc), 0);
-	} else if (cookie == jzchan->desc->vdesc.tx.cookie) {
+	} else if (jzchan->desc && cookie == jzchan->desc->vdesc.tx.cookie) {
 		residue = jz4780_dma_desc_residue(jzchan, jzchan->desc,
 					jzchan->curr_hwdesc + 1);
 	}

base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.39.5

