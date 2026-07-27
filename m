Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B663D1CB0
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184652; cv=none; b=Hmt4QzUdrQwrvj/9/6lb+e8Rc07xNQ46iUZ7UzVqtfXi8CncsW0AJr40srZfk1ItGwbx1fikk4dTvTXRbqVWXVUfVG6lenV5jxl/azlRb0/OOoFp0Wyk3o+AMLHocFwKxcVZ3vOUeRjMmhbx7QfbIdKIEjm5CCSI+7EBAB/5/8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184652; c=relaxed/simple;
	bh=as2uxtCX7qs4PDPkqSWMGU871k2muPPEc2yUiG+20Fk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lx+8eT/JyBBE4DDNu0do1j3DYvu0EjCkDjw4L7y9enY10koyM5hllIj6/XcEbp0ZHMmf5jGaAipABmqDkZiDRdjLKlVkGoCVvvLLGHOUkwlwKGnBKOvUncw3c1FIb9cfgvBVgdOsCf7O96W2hWGj2V6/HV0bP3FU1mb77nuAriQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gateoADZ; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gateoADZ"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-845c92bc464so2605724b3a.2
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184650; x=1785789450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PLfj4e7PYbv17pgcUAJcNclY2K/xl/o48sCMhXJ1vaY=;
        b=gateoADZSw1v/9qNcG1t4BhBKLHRE7M3PdiprZRuipFO/KelHSF4KXi89WQIHFJBCW
         VxA4txgbr4QMydJrXGQ5QiRVChjWRo19vSeqgnV6xYJIyc/LEyPKWAuwxxdZnrc9B37Z
         sXHcPLxcdZs6cuuSEHm8C87Qp6zyl2TwDvI9T79EPUAFchqfHLgCHptduTibF4Ti62RF
         QNiogxfHVGUgr0JUbkSBQVi0nxrbJr3hcfOhAoKnGjcLr6RXeusW9a01z2WJvIO/oN0Z
         Mkqd+euI1nxdqWrqlwecmsbwKfNfwTSFcpliC+9G/jnOEwJ+pDsTuAn2mz7mjE8qnfGO
         q1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184650; x=1785789450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PLfj4e7PYbv17pgcUAJcNclY2K/xl/o48sCMhXJ1vaY=;
        b=O3WWa1Nu7r15/Y9J0Gkzvf9ZJ/Lcztn6YtKpCfwg8NpB459g7mEyoK/tQGcPIuRY51
         3oYsbP46scU7wsZ0/Rk93/HC0EhsmpzsxbgnAoi6GgMDQawUaZvumJ4UI/KvojognHrt
         QS715tNn5OB5fEHydKQMwXNHrsTi6RzvTHkhvReh1kasceFaWAPlW+6ZDJqXu3+sgVwe
         +6v0yPLj2JZuy4VkvyvKqpKbsn/1ZJWAKQiPYSUpzdJDVkQJra/pL81OCXqUTGxpBlW7
         YLIo6dqmYfCpwj2B7INOfuqLuQR7DabWamdsFOPyR75awyPu2m1BaL/rSh0uLYsYrrf4
         sAxA==
X-Forwarded-Encrypted: i=1; AHgh+Rol/VT3RcmgIgEKQSWADMSZ2ko1GaPnJiuJrSS3nfbJLvQecH2clUAlERIe0HYb0q9/rNDALD//IME=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+LEKjLbW6KfTa8Bh4w/NfwY9gdSBYvdbIuvJMsJV4Hp/uUUwy
	By0tN5nsY8XX9VvZfkRkHg+ywQ3+1s0KUpyrYya/2llCzwpyr0LthWhY
X-Gm-Gg: AR+sD12GP77XAW0+j/12uifgIMcLvi39075iqGcfNcmirl7m0XBImmv4vzg8BbUHdtZ
	m7k3PwZ/wN/BIW09vBsHpHpaMqFFfMxEBqzq4rBQ0aBq+ZNrTHCX0Z2PVlh2iOrkvtAlUxBeJg5
	8MVfLR1VkjzJdt0OjhXaBzEnAxNpJ+FHYTthDCgCx238DRJGC7fHG7uWUA/bt/AudqfWlgMjPi5
	uVOKKq2Y5JSEqWcSE8kwfnjLC9PZse4xlirXWnLrzE9E+mpqtTmWA3SSYBSdVPNUgHkRkqrXhD6
	etp9HpCg0I7i9DNr4/YYNXV+a7quEW0Jr9i3JxDljb3pVCLltfomD0YwZ3V1tzgKAdDbfWme4Af
	zFOLfCk3qj/bjfYv5d8uqlvAh6p7tVXQawvFECOfHc0548vh5Ns7OWmWST6uANSdWGnMteLLUcD
	vV7HZc
X-Received: by 2002:aa7:8888:0:b0:84e:456d:aa5b with SMTP id d2e1a72fcca58-84e595f7ed2mr8128845b3a.72.1785184650522;
        Mon, 27 Jul 2026 13:37:30 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5327f116sm3507549b3a.16.2026.07.27.13.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:37:30 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 33/64] dmaengine: sun6i: kill vchan BH on teardown
Date: Mon, 27 Jul 2026 13:36:10 -0700
Message-ID: <176cf55cdf7e686ba064befa2b257f3ae76696ab.1785183549.git.allen.lkml@gmail.com>
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

Use dma_chan_kill_bh() for virt-dma channel cleanup.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/sun6i-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index a9a254dbf8cb..9289c24dfcfa 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -1097,7 +1097,7 @@ static inline void sun6i_dma_free(struct sun6i_dma_dev *sdev)
 		struct sun6i_vchan *vchan = &sdev->vchans[i];
 
 		list_del(&vchan->vc.chan.device_node);
-		tasklet_kill(&vchan->vc.task);
+		dma_chan_kill_bh(&vchan->vc.chan);
 	}
 }
 
-- 
2.43.0

