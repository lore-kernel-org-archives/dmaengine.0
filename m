Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792703504;
	b=GhBZo8FeWkpU7BJNdhczzv4we5oZeTkEY4bAD1GwizBujrDXSwPjVz6uwhitTS4bz8tr
	 fShJzk2YNRmgazWkhkzbqWYHUEP5DE4K94m9gOrqw57eAoRsyGvp0HAvMgVooB8Hab5cq
	 MF59gsje3ByiHf+O6iD5YDPbB/GEf4obwhoKskqKESk2VWUOe7/rUDsllm5i6jRmueFQk
	 Vkpr7eJ5o2gB359FSnwdUnAIXaNUwZPI/sYIY01/HVVUmXyZwC9b1JwT58BQkB+il2Huf
	 ATbWeMeKiDYOiQQ6x5oWrchMEI0yESZnCkEsOdGRwx10n5pu+aNcK7KfOV+KPuFyItw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792703504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=Mi3XzU0RNWFyJ4e7CUa62rc+wGnBh7UsoeyqdHtTKAc=;
	b=VOGiC+cChGh1X+IRmjaK+vET9rGHpF2IhCWkb5tsZ8X6Bsqluwtpw9f3VF+bXQBJr4Bb
	 YTENA0La7e9AeEc+gTe+6VAtrC2m7kGee0ER5+llqppUdIpcspEVna8CnurBeJDCRtgkc
	 bRIx5SODS+GGNOOWZZCWEofpNpiVAEES/bcNSsfuZjCbSZUU+CyCY/G1ZiEyD/rRnpT5/
	 ATOwPfEi/v+4ery6ZdDNDpDwLZBDXRiCo9YGmb+P4MKF2PQzITTBiIB499r4xXKIttkpw
	 YDTcoGdQQ6IBwb9itpnTcfrTOtp4zoYwUuc+nUCI9XO7ivDzMhYdRcotMJiv2+YM7Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=El094RDy;
	arc=none smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B715606A319
	for <dmaengine@vger.kernel.org>; Thu, 22 Oct 2026 21:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B715606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=El094RDy
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4a451915d8aso234751b6e.2
        for <dmaengine@vger.kernel.org>; Thu, 22 Oct 2026 14:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792703503; x=1793308303; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Mi3XzU0RNWFyJ4e7CUa62rc+wGnBh7UsoeyqdHtTKAc=;
        b=El094RDyL1Lws/bHb3SBNKi/bky+9gn+9vrrLhK+j5PmnCrRD0pt998UqvPrlz+/uO
         fhyBhzAcLcZ6zZmoaFrIQE/GohnkTtsEsjx4mmsCrwPV4uEB5M44rnp/DgqARi7jyUC0
         QAY2nNhzpPe1uWC/0rEpKpPalW8IKXWXpa8KsFB9k1KsO7mDddstls0u7R2smgKPAlqV
         GBhMfi3Ot1lMK9Rc2CrbVLRkbU7jvXyuSthFq93XpKk0MIqK+kEEe8KruOit/NapzEqL
         /GNKBcRdia5qcLYfDWTTES7+HVr/jzSkDcw7QT6tq5OIH91t3noWu5dvX6SL0lsecDo+
         BSQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792703503; x=1793308303;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Mi3XzU0RNWFyJ4e7CUa62rc+wGnBh7UsoeyqdHtTKAc=;
        b=gzKE240451yX6dcd1E9/sv6NsfTNoEu+hDDE6ziD3hAsvJBgdqljAKTuuBcEWtwPX+
         3dYFLrpXXi7fIKYb/qXeMzri5dIDRsJb2v28wR0r7N36c1ZxxD3fHWCf8qZMuaM6E5vI
         HI5Mpe+MizOiWvzrHakjOevyUQufKi7nqVpd9c0O6osHpmgAlA6AyhMkZcKBS0Rf2Y3F
         IC3zbUiAMHAezZwg1ZgESAdlA+tMNo6mHwToGPe4uNM1R3olb7qB8MyqdzQnLTifwEuz
         JjuCf/0RUnnt10X5uHfb0S3U/OP2TYxSQDhd3jmejIfMgU4LqnLCXXG4TABvHAMN0d1/
         Bh7A==
X-Gm-Message-State: AFq9FYL7J0eOQCH6uj5tbCBBI7mUTtlsOeH5uTgR/Dgkhwa84PwNmyC4
	jQkwd6XXlqtgxvqHj7IgPA7cWh/rDnMAnYSr4fR+xZROV0MuI+LNIQV7
X-Gm-Gg: AYBFou25Ddp39dOTCMoyaMUCbY+0J5BcARXyf3JxdJAWHZabUSPXhn8w5d3nMj78+h2
	cDmAfrjEsj8dBddFAbQoBINvVq5jbRQs1x9vq1iGgFtRK+kXCaHFfGht9gXJMW/+qZ9wxgTkp/E
	BYlZkkT78YNwZZO8j477/eE6x7xnXL9nBmcZiLH03m/RO2kL6Vo/YCbRLczdowArPxf+XJ6DjNf
	F1OMwB9QCbsUjUdo01ebM967sMGAG4Sgp24a9zccSC8yE9fSHsoq0s8YoXs6yhI92Y+LG/+0dUT
	jyb3Q9eVLdiQ4VRYK/boHHWAo3z2Kg5iPO8OGFiFaEN7qgams1EutSeXhmXnNjqn3xrTN8vpwy1
	iQ2Gw9hGj0I6Bw8SnhVAwFWj1RLm/wIdtd5DXi+XHJJrwSntoPNBAeprI2uha48VLBtkjCuMJq2
	LQMnxnrymqZzqlrYCL0xQ8lbgqZHWZODruej5WJb5QjcHJxhEVAJRbwHof8BTOjrVRQBGC5q21H
	Nd/ZAa7rVPl6s/2Qo98KE/lEpLaeh1jsjn3GOSWhP+oSgCFEGZfbCX2KqwnHA+fyV4rYFePzqL5
	Yab2faE6PyTzEm3FVjiZakY8WCb9apHgDoYwRumWL/q8E4/NSI18lipe7vEsGUE4CiRyfJzriaw
	3MwvSuc1Wk50rTMCfgfaad1wT9eCJwiwtNY4V5pTUA7lGVuwR9k5E8d8aXBLu66faQZlleybmBq
	Horg==
X-Received: by 2002:a05:6808:1715:b0:4d6:92d4:c806 with SMTP id 5614622812f47-55be87540e8mr194875b6e.62.1792703503249;
        Thu, 22 Oct 2026 14:11:43 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55be934e467sm78324b6e.1.2026.10.22.14.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:11:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 15:11:41 -0600
Subject: [PATCH] dmaengine: mediatek: uart: clear the active descriptor on
 termination
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
Message-Id: <20261022-submit-mtk-uart-dma-retire-v1-v1-1-3f9b99a9d89a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBCF4auUrB1sIrXgVcRFmr60oyTKJC1C6
 d1N7PIf5n2bShBGUrdmU4KVE79jCX1qlJttnEA8llamNVfdGkNpGQJnCvlFi5VMY7AkyCygVZN
 Hr/vu4jrtvSrGR+D5+/fvj6ML8ITLFa0fg02gQWx0cz0VDnHiiPOx2/cfk+Fa1qMAAAA=
X-Change-ID: 20261022-submit-mtk-uart-dma-retire-v1-fe71753c51ff
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Guillaume Ranquet <granquet@baylibre.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

mtk_uart_apdma_issue_pending() keeps the active descriptor in desc_issued
and stores an alias in c->desc. Terminating the channel collects and frees
that list, but leaves c->desc pointing at the retired descriptor unless
the completion interrupt has already cleared it.

The next issue_pending() requires c->desc to be NULL before starting a
transfer. Canceling an active transfer can therefore leave the channel
unable to start subsequent transfers, even after synchronization.

Clear c->desc under the virtual-channel lock when collecting the terminated
descriptors, after the existing interrupt shutdown and synchronization.

Fixes: 2537b40b0a4f ("dmaengine: mediatek: do not issue a new desc if one is still current")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index f74e9a328588..d9427d56bc50 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -433,6 +433,7 @@ static int mtk_uart_apdma_terminate_all(struct dma_chan *chan)
 
 	spin_lock_irqsave(&c->vc.lock, flags);
 	vchan_get_all_descriptors(&c->vc, &head);
+	c->desc = NULL;
 	spin_unlock_irqrestore(&c->vc.lock, flags);
 
 	vchan_dma_desc_free_list(&c->vc, &head);

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261022-submit-mtk-uart-dma-retire-v1-fe71753c51ff

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

