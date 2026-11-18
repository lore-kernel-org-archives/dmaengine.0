Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794960478;
	b=O7bzjargJ6uOklLyLEu3eFQL6T6UrvftpwidhB+OAUsH3pM9mLzRYcRIxTnET5q6JxXR
	 iQitE7cw45nti8m1o4QjhAzsc6RoeIB/DqtmT9GjyEMpG1RGYEps5E+KBkPr5CjjHD3X6
	 Bv1R6lWl62surnqrsTrtqOy1pdBwniDCHulvkxem2tt7dYoJWlixGSxTzWAz39GwUaZsR
	 7SYDyMVoxvoQEt5bIgKU9g5TkBx7lIoLf7MVu5uXtKy8H+cEGJFC7K4LtQaVoBUlSq4Pa
	 B6j1/AOycDUI+BxR7YaAhSB9oKiwPlHgTy4yZBPdLid8fZnLQpdenneK/a67zqt/MoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=AOVjVYWiGu1+2CTZWPQd/l37VMMlzCbF4uz2qUZJc8U=;
	b=FVEu/dfAX5TbNdvaNvVgn0rgWKG7YOe7ipPB0QdCFP13cXv+wihcQPbdOOqLCMEpHlpH
	 OFx18ESJAdT4vnjoZjb2XTaNPdyBcNlkN2E4j4xtA3j18HAsItPx4WgLQPScq0nvdUb5I
	 4P8EMJa95TOId6IJ/FK1p07XOH6J/wOJeZ2T6o2aIJVZ0SsG5/R8QIb2yaoptqKS0OY92
	 rqSFN00zc9eZau9cj0YrfV/vrJP5KkgG3Zmqq7XdyFbs8INQEHwiJHJUCAZIYeRFwbxjB
	 //5D2uM0zZsxMSS2rkxgp8jTVEPGlRJwftlMYbPGhv+0EGMRMOLTM7CBoi59CKKrBZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TG8OO5sR;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB047606A88A
	for <dmaengine@vger.kernel.org>; Wed, 18 Nov 2026 00:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB047606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TG8OO5sR
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4911df1e196so259989fac.1
        for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 16:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794960477; x=1795565277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOVjVYWiGu1+2CTZWPQd/l37VMMlzCbF4uz2qUZJc8U=;
        b=TG8OO5sRdGdUt09EZBY5KLUbbKwJFAAZgRkFs9hz3cLqeb4Ox0FhXdC+l6EWe/l3/K
         zxrRL84w4viTDvdzLDbVCRGI5dyxtzH3U2vLZe7abhs2HuqdunzcfTmM+r8pGZlTcCTq
         +seLN+jg+PzB60eTa7cnrgiYV37/PUcY/u0w1mx+u93qpwuPKKAmM4QjBXgBShEktodf
         Mz2+q2WkYFySmnjBVTbwL7RGiUFe2Fg3r6YFl41WTgucWSMEMJFeWzfslMGJq0T+1/7g
         SNhZdcg3sHsStcLL23NZB9xSfja8muqz2XEpD+5zUvrI1Oo1bKk29xQn7DTp6JeOmdcd
         zFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794960477; x=1795565277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOVjVYWiGu1+2CTZWPQd/l37VMMlzCbF4uz2qUZJc8U=;
        b=qONIyWePwrGk8jpokvIGC2vADls/ctWanvEveneaZTlfCZOefA1305VbaurWXxYVGC
         U/0oRmNrAdQKB+fCyz1oEoBOTqsXKOp44ygVd82UYPTcF+xzVSbIJ/mUWN/hgF/wYpdS
         zmEzZIWB7xUrZU1zgKjeHDuogdPPDJbs1hWggTkcdcS6lOJyPHbcyc4lRx/2FTBY4cWB
         s/Gn0Npctkge1FX0ygK+GiaAJElvwHSGTXaH+daSrwDzssc0NTD3iZG6pyw8MR3oaDIN
         UlS3bWXbaabw7J1r1ekQmmZkmRSkxtP1ctTtmTbYMBmhqO52iySAioo0t/bkl7sCasVi
         i3qw==
X-Forwarded-Encrypted: i=1; AL+hErHBGJsgo5JVCwKqIzkFJDzIQBGU1Uj+kVoIQqsJi9cwVxyU6fs3P7MgQReKNn9n/VmBS2KpGVQfeOk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4sp5JCopwLnF3SbqjisncGu2Ji+nDh2lyVkq65qgoD64HXATd
	FPTJlUVH8WKAbQemTRsrmuwIKxkQ/FMWCEsSPVnn2SIOg/DXmdcYSGid
X-Gm-Gg: AYBFou3b4DDptNLvLE7J9YfzNRsDXMGt0QIXmOVASLZNpJ2Hq5Xl8eEvgY7f+O6fAeN
	7oMzzSePltTbwYbp2s15iDAc63s0FIJrbINcJsUET9H0tZTA7/0dZp3oErXkPK8pxGepAqaqBHY
	8vFKDz6Pv3ngVx2GVHTDTQthBngswFUMXUAf7yJ5tLDVwkGXKWHBbvyKHzeqGC4Z18zakK2WVoS
	irtpeHdKR0SNpwBGscT/EPJRmTgSCpNNOcvVQPhC8IqHJSmbOiITQNdYooPXBiGBC51TarbcqeA
	RjnEaOtMR63HI264Jzwq/Ygo7DwTeBmeSAV4BlVtBoaGqX/qE3ExnzXJ7BpRzWAvT3Vt8bVwOI+
	1TS6BXVCVcHcvFBru+biJ/PtUeqrlxDwW4zGu9Rt7DTh8R494qOLy3R478ibDo5oeWm/Cp8Q2oh
	NXSjiYv2cvSEl/447cE787PPp2EUHev/2E4eXePjRVWr9lyHAPhRLf2bWdOwj1YtQ/beVUA3OqT
	y19h4C4pP7gXXfbUDaHe5KA5KO9EEsvvxDClnRuZ/YMQmMpgEQQ5fYb1/ABcKUbzwGYaQ7lYhSl
	8+MTnhITqxlAViIpAiGaPB+I8RZ7/YXjsw0eSKKAfKM3RXtmeXHOFx9UbeyIST4KUM0NQu3MiZG
	XTZkHA8LiQwUwtrdC+zFJ3Z6yzJmORpuV3Gue3B0QQjNaDc+N7ukgNRLrdC0rFluMLpKORBXrQc
	OmSQzZGajkcUH7W4oWdQRbIerbAO0OmpMw/dJ8lX730rA4I0PJJZLeyrJcS3YF+9oVp0MGxpuA
X-Received: by 2002:a05:6808:14ca:b0:4b3:8d45:aa2b with SMTP id 5614622812f47-5774045ca4emr1613768b6e.16.1794960476659;
        Tue, 17 Nov 2026 16:07:56 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5777b393d40sm434954b6e.17.2026.11.17.16.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:07:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 17:07:41 -0700
Subject: [PATCH v7 2/8] dmaengine: dw-axi-dmac: poll the correct enable bit
 during termination
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
Message-Id: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-2-d5f2309afd72@gmail.com>
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

For channels 16 through 31, the channel enable bits occupy bits 32 through
47 of the extended DMAC_CHEN register. dma_chan_terminate_all() only reads
the low word and tests BIT(chan->id), so it can conclude that an upper-bank
channel has stopped while its actual enable bit remains set. Descriptors
can then be freed while hardware still owns them.

Poll axi_chan_is_hw_enable(), which already handles both register banks
and the smaller channel layouts, instead of constructing another mask.

Fixes: 495e18b16e3d ("dmaengine: dw-axi-dmac: Add support DMAX_NUM_CHANNELS > 16")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 6dae63024721..405ab9a78955 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -28,6 +28,7 @@
 #include <linux/property.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <linux/time64.h>
 #include <linux/types.h>
 
 #include "dw-axi-dmac.h"
@@ -1179,17 +1180,17 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 static int dma_chan_terminate_all(struct dma_chan *dchan)
 {
 	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
-	u32 chan_active = BIT(chan->id) << DMAC_CHAN_EN_SHIFT;
 	unsigned long flags;
-	u32 val;
+	bool enabled;
 	int ret;
 	LIST_HEAD(head);
 
 	axi_chan_disable(chan);
 
-	ret = readl_poll_timeout_atomic(chan->chip->regs + DMAC_CHEN, val,
-					!(val & chan_active), 1000, 50000);
-	if (ret == -ETIMEDOUT)
+	ret = readx_poll_timeout_atomic(axi_chan_is_hw_enable, chan,
+					enabled, !enabled,
+					1 * USEC_PER_MSEC, 50 * USEC_PER_MSEC);
+	if (ret)
 		dev_warn(dmaengine_chan_dev(dchan),
 			 "%s failed to stop\n", axi_chan_name(chan));
 

-- 
2.53.0

