Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794960479;
	b=bV6mVc4LInam7MBgcihv5ILFteb1mcPju7hcVYw/683ebhC8SB8JTDvstzA3FKUxh1uw
	 69KcaxEcam0W5NBrb7qAHtmwMX3Au9x7Lg2IeRJFtcnE7CmcyKwwOjr6u4NSo1ci2f4yu
	 vEvQgQear8ZaZviRHgizYFipjSCQWDe4MgC8drLYPy93z/rgpcns8tlZ/CWUq+G2BP9ma
	 wdM/rWNWLWv0/z0lk3hUjuVnvRL1OAym6NQRDwP/rnfUfYbeg82/znoS+xBkmWuLIk4ym
	 LgPblZ5dUaSSI3/QRk+7NTcGxU/4C1/N4QxeY2HxF32i4TsIWy9HvuyvT7C+/NHKwHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=JO4lonZbzonXjGudrUdKykQEm0Ub0u8cq6ZIlxF4Esc=;
	b=obnnxBSr1C8UNtAgGTKpLU0jFV87zi02xhnA47Bfp+txbTIK3TaUoNErucESlzDAceWT
	 hg70cwlOQzDMy5vLEr74bdfZhmlsFHN2V+ttJiYlNo70u4mI26gLPu1vUhG7bMrxUE/cq
	 7PMtfOa0LkElqLNMXQFUahZzuHRPKe2rYLnPJWYRmnQIq4mwMwjni6tcLxMvikxhtZWfg
	 7uINGFyAUndg1RO3i2ykvQHmkTK7d5vUCwB1+UrxSwEXTPksLTM/5UZw0ykAqd+1G9JiM
	 R7WFw2xv8uthpUl/JpF0pRHf3d0g7FvCOjyGJbToHQvFA0N9+s4t0mGUOsMwm5ngNyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jLUb2Ltf;
	arc=none smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3997606A32F
	for <dmaengine@vger.kernel.org>; Wed, 18 Nov 2026 00:07:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3997606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jLUb2Ltf
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4a76f63b243so1173191fac.0
        for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 16:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794960477; x=1795565277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JO4lonZbzonXjGudrUdKykQEm0Ub0u8cq6ZIlxF4Esc=;
        b=jLUb2LtfTCdiUt+qLSzNRLh3e6vtIXez0t0u5ZErLAm4Piwa4rdkjyp1u/qEfiJ0Ld
         n2aeZ+e5g7TSqDzvBPP+wWpyAX+nWKEKudMkqJMWAuYCJpRAnsk0dGNVHRFMHKbVJF39
         POfWEurkqyiwTLqiJtr2pyWolsPfe54o/pU3vDVvzewFPonzMSqPSMpERUFafhInljHX
         GYUK6c+mlIG/tsVFGMzVhqXzas2AW4S9Af5upcFXpj6bWSjNss1giv/k6TwmtWP7LcS/
         QHxpPue0n0gZyGOg9LA8WZR3N/sqGsfBEyk0AFVeoMqY+1vyDvy711CsO4IgkNgANccU
         N/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794960477; x=1795565277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JO4lonZbzonXjGudrUdKykQEm0Ub0u8cq6ZIlxF4Esc=;
        b=vSa4LyP9/8HPpmLqRJp1FN1Qm378JaUWVzE5n/aDOVi6ljfPtJAizqKYTaQFApevuS
         L6UydB2x4xF7qXAYXf9ThE4l/Af4QadmjiGJFiHMk0wE6wwVRG4KHreZeSuZc5KVZTX3
         oXBDsO7Fn1/WAqkFzLAN9h0SRRsgDycaanRqOXoXfzMfa+HIoP4dIjEgVK4+NTra2K/Z
         Ri0XG2dAxjkv+AaoTA2+W2Ow6C4wGtVbqegloCXPgRLwTufdUUX3HF0i1g78DjpMFGww
         WZL2L1LeXk9RLKY2QWZ8P2rEQScQx4+u0TPis7rm7x8jz/Suycd+z+zfEhUR5sxhakyk
         zJsw==
X-Forwarded-Encrypted: i=1; AL+hErEdzQ8GjQsmAYfhscqI63KmJ2MJEOga2SOUdQz5n+NRrzc5i2MAzAR5Ncudl/ex4M/B9fZzTjfgCGs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tdMrTBqenmGLpjNklexAu3OBGdnyM6pC7Aqx84k9bwXjpXzU0
	9frv+9ttMHZosdpBEm8oaQtOe0Jttjq0QPyPDYBqHbuwt0y/yX7+FzFR
X-Gm-Gg: AYBFou0f9ITiz7+cOr3y+RuRDNMWCN90gXNuqzgRdyfO7MIcvQLo71VUEQKYUXc7gY4
	02Lf5qXsBjrnU7Ao00Bmcu1FvL7fBAXQYCrhCPwMlfESMEIG2WWvny6A+oEDGj+3ZWWAwYCE5R1
	1tnx9983e1fp6TYeMcxtmPwMMm1De+dnZYXE3r6y5zLr4spuc3oxCSHF+weC9L5Toi5rr/Gpnzu
	MvXCMsNAC5o3tsaKqXYJXlD16xYtDB9cjrYPJaBEtT+/BnPEDY5+tAWpQE/Vy2IPdRTzfYp4k1k
	g/xaGMJsFf1Fad21TTlGA5S59B0q3n6NY6fbDTLtVvHBCML/3BISa87lCvXQdyCnC2tTvKtMp14
	GW/dl29vglnPqdz2lJKkdh19TWeNDvHZdNrp/f+1hJBileglo7lOvIwSR6Gq7/+WSWoTO0g6HKh
	3D+8yBxkXhkp4fadhCBSze5xRa6EtYvBI0YmsaN6g3zBlUxmsFHK6a2eP0qaLAVqlc6pYQNmfDZ
	XMGtNwK5+CxzRipDmJb2Wcdb/QQbj+mSnuKRaPUSm4GXfSAO6fFtSqRfxQy8iZUmCzfgR7t51aG
	6R8xqbL3/wL1mbsdT4RMrEfTbSFzWAtSETVNHWhEQtdEMK3to+MzqWXMad+gbnp5jH7hEPl9Y1k
	FZG4/ZPnmTHU5wbiJ3DeM1Ft5XW+wENZD+mdlWoRFsyh1CNEvZy/dnE8hcQVV9/lbIXlbK+QgKa
	U7un+bI3kc1xVIZC6QewbUleoF1rwNe+bLDQ+UsBVUdyGykgJWxlE=
X-Received: by 2002:a05:6808:4f68:b0:4fb:c2dd:c7a5 with SMTP id 5614622812f47-57740a52bfcmr1093436b6e.31.1794960477683;
        Tue, 17 Nov 2026 16:07:57 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5777b393d40sm434954b6e.17.2026.11.17.16.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:07:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 17:07:42 -0700
Subject: [PATCH v7 3/8] dmaengine: dw-axi-dmac: retain descriptors when
 termination times out
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
Message-Id: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-3-d5f2309afd72@gmail.com>
References: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-0-d5f2309afd72@gmail.com>
In-Reply-To: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-0-d5f2309afd72@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.17-dev

dma_chan_terminate_all() warns when the channel enable bit does not clear,
but then frees the descriptors and returns success. Its synchronize
callback only drains virtual-channel callbacks, so terminate_sync() can
also report success while hardware still accesses the transfer.

Return the polling error before detaching descriptors or changing the
peripheral routing. This keeps the transfer resources available while
the channel remains enabled and lets the caller retry termination without
treating the timeout as a successful stop.

Hold the channel lock across disabling, polling and descriptor detachment
so an interrupt handler cannot restart the channel between the stop check
and cleanup.

Fixes: 1deb96c0fa58 ("dmaegine: dw-axi-dmac: Support device_prep_dma_cyclic()")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 405ab9a78955..040c12d07db2 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1185,22 +1185,25 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 	int ret;
 	LIST_HEAD(head);
 
+	spin_lock_irqsave(&chan->vc.lock, flags);
+
 	axi_chan_disable(chan);
 
 	ret = readx_poll_timeout_atomic(axi_chan_is_hw_enable, chan,
 					enabled, !enabled,
 					1 * USEC_PER_MSEC, 50 * USEC_PER_MSEC);
-	if (ret)
+	if (ret) {
+		spin_unlock_irqrestore(&chan->vc.lock, flags);
 		dev_warn(dmaengine_chan_dev(dchan),
 			 "%s failed to stop\n", axi_chan_name(chan));
+		return ret;
+	}
 
 	if (chan->direction != DMA_MEM_TO_MEM)
 		dw_axi_dma_set_hw_channel(chan, false);
 	if (chan->direction == DMA_MEM_TO_DEV)
 		dw_axi_dma_set_byte_halfword(chan, false);
 
-	spin_lock_irqsave(&chan->vc.lock, flags);
-
 	vchan_get_all_descriptors(&chan->vc, &head);
 
 	spin_unlock_irqrestore(&chan->vc.lock, flags);

-- 
2.53.0

