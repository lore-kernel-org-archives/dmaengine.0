Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104110;
	b=Deg4ji89S6pLIQIu5H/GrLWlDJxW3+86S9nDzrxW3/+VUjCe5ivFwViL++Zv6xBMfZRz
	 TmHK0khklKzQJ4v+UPpkeRhvfkqVtxmk1BQHrfxg1HKcqMiMPeIcoWrYAMbC26lHwXm+X
	 f2EaYfy1SjtanC91qT+pjFpcrdIC1Bd4SzG5JRKAHcYllL4PeSwctdzJg98ia119jXIpW
	 BnqGCWkI1hfGYdq8TzoyAnRa4JCzlG8KST4/t3cIGZzMFicrgphkLWdo5CHBaNtag0IkM
	 IYcHx+N+emOcBd5aBZ2pjDPkgkl3OgsTLtiatO0XwmyFWZm0tJdf1SwMZbQQ+qQozsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=el2MHIKJ5Z4WB+AKjBMobDh9kIZo/3FoYu2Srbuo7UQ=;
	b=twA802TLqp95OnSeCpYe2ejQaDLEbklI0gvEvSUeLucWlJcv1dvAg39f9nHKBUfqA9L4
	 yuwJKf7jLQD6pE+iP8YMFN/8zMFV/2MFnEP1rCtsev9r2qHXH/2Aq+28yrv6e0M4/6W54
	 8Iv4a4V9GkpOd+neVxgz3PnE1uovcfhELxUUQBP3o5CjRaq99TsNOmmDX685tNC6RuTYB
	 kd+wkFsEze1oec0PmVEXfjpcUqNnga0PxSdGcFw9XOagi5wgnTDkK5C/doXnG1LSFhe4w
	 eu7RZNXtrfuSGUfhngd2oRspDAL9j5rBIeiMkgTI+6HTGahzUS3NxYNVnE2tP8VBI2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FvGCDrfp;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4745860A2603
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 16:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4745860A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FvGCDrfp
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b4fb5d96b3so18857257b3.1
        for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 08:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795104109; x=1795708909; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=el2MHIKJ5Z4WB+AKjBMobDh9kIZo/3FoYu2Srbuo7UQ=;
        b=FvGCDrfpoahEBpeqj8NmzdOQMhdaFuJ7quceODcNx0YXny7h8zwkwWyL0C4P7do4IL
         zCmpn3ql2iUq0GnCLEFJEz3iV4MUKxB6kTrHvQR7/VZwbq5ccT5vzpkFtzdB4Mnx5rWk
         CQzSd60XEAlCzXaXqhkp2QQoMSQRenDAporkC4rfdWocus/XgrsyanBan7ySVbrqczXU
         mOqrDZmiXAfwNQMgf/CUocIQnUPceo6I6berQEOcTjHDOt/5PvAQRRMpzvgfqotU9j/E
         ZnLZF51skStNaghZ6/DNqf2ihw7s4a75nPS7b+kR/bk9jttSMvZesaabiIn9ZiOFdg4e
         rj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104109; x=1795708909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=el2MHIKJ5Z4WB+AKjBMobDh9kIZo/3FoYu2Srbuo7UQ=;
        b=M5ySFjRuWmGojkqefLFmJxQdAa8XfkmURfyYsIf3GFioDBdkCWkrCliZRT0cNrRkZj
         cC/yvr88yBnc6JhiYcZkjTKJGez1qDaH9l6RToajbApGNU9SIt0+Ag6whFAc2t7WVJTQ
         nFsOeEPzHW6MG4iflMFfejREyT/H0VWBOb3Tmvf7JNcEUFqtOGZmEh+bg+WeT+QGTRsx
         3BlNV/+E4gaTZzf/Rr9V4Cwd2ktCu2ir3Y8Vy2mEoy0TDS/4xomAw0vhBKxCbvUIgp8S
         JBfF/yfzfZ1xxlZvuWX9QYFKkJBZis4sqNK79PdRweVBpRVVt4VpamkD6+8EiEkUso8u
         aooA==
X-Forwarded-Encrypted: i=1; AL+hErEKKtacDycaaOaBzGZBReB5pCjRnjDR5sL0Rv/z8Dxk7oI0n7uwe1Xc/8RBX0bVE1qc2+S5YJ0m5A4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VLZHTONWAsrpBFQwsCKNMvqiFuKR9f/dk8ttxQeXjDmtnYtkv
	qR9xADnUUONV9N43H7YlyqDQGjZXEd21JhpLa6Zn6RWZ3XUQ9JoMPUCR
X-Gm-Gg: AZFdTZeT3z6vo5QNeirovrmj7WaRuQi/XBCH9dUdEnuY3t/tvIAjgKUGZWPdOwqEle2
	mRjdLDJqPbD8Wynp5Sj7YFoECcwFDsxW6si6IVzznVbkR+x/V+Ilq4qROehhMe4gX9Pq+sqqvhI
	LoPcEv+iwfckJ2dasMvuu2oWs91mmCN0rFXoUPTJELJytF26p/P8FAdZVFkhFH+ZQkCmP7q2RAB
	qweoyv51D+xdz9vVUC7eq3jxHKXBOQNz6nTTkUsWGJZAeZtIRmny+96H/mVoScYSTe250Y7E7cE
	tQRexf8QQR6TkrYAozty5AzJ1ztvvl74kv/N29rebo50GJzlVtWauRz7+g2Hvuns8h8NhpP7AOz
	3bGCclTD89VVgqPeL7hJ9FglRKSx1JRRR0EiAXdU8jwEcTqRuPOviCioclZhzvxB4Idnqq/OUdc
	CLmPuIrJ+BJfif1W7MwQrqI9OWvAot8kPWXiATc1tVWdEKVjD/aFhL8bV0RCqHxvpnaorxQu7B3
	y4h8gVCkS1b2ck5uvgbmODjgFpvq4zhh1+TEzXlVZrtrYnlkGLbdK0J+P0X5VqTMvtSziGLMJy0
	buh/y98Gz8pzqkCOZ8mRa71jUtx8iVIPLyETNgzp2/Rf0b31H4P/2fwGfVmIZoWu/nyc4Ub91Me
	PJC3vbklDdcMNrwVLgqNBCPuSgXKMVILt7ZhDeHKiD+vITSjbYlMa+xeynbQNkPfeZzFWHU18e2
	0qLUNyZ4S66pENX7mO5mYi58G1FTaxNcuVu/0wKhBgDcJrCZUayI4=
X-Received: by 2002:a05:690c:6983:b0:8b1:533a:e19 with SMTP id 00721157ae682-8b518f8df4emr5599467b3.35.1795104108956;
        Thu, 19 Nov 2026 08:01:48 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52031aa4bsm623267b3.34.2026.11.19.08.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:01:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 09:00:57 -0700
Subject: [PATCH v8 2/9] dmaengine: dw-axi-dmac: poll the correct enable bit
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
Message-Id: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-2-f8e7fe60594c@gmail.com>
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
index 6dae63024721..f17a71183050 100644
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
+	ret = read_poll_timeout_atomic(axi_chan_is_hw_enable, enabled, !enabled,
+				       1 * USEC_PER_MSEC, 50 * USEC_PER_MSEC,
+				       false, chan);
+	if (ret)
 		dev_warn(dmaengine_chan_dev(dchan),
 			 "%s failed to stop\n", axi_chan_name(chan));
 

-- 
2.53.0

