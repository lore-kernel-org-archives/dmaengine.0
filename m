Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EEE4399EF
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184878; cv=none; b=nOJrwdMP6KZCLEFDf9dXEg9ZKgW4j0j+ZO6fF35BboWEWMxEA8ipWRFCWg9HnMZiunt1fY93WCLwrdmoeDYFD3tlUpYtMTv1GO0hAfCHaZ4CPK9VQ/dLHxJo55PBhjNKUHvvdJgtNL3jJgKU1V+iRzVJwS+CCXO0xse+yRZc8AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184878; c=relaxed/simple;
	bh=cWjP7LzlVqxQbyKR9XTomd8cu5XOyupmxbQxtPdo3aY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nErPiuF3eHxEYx6+P/wU3hsAw9zVf1TDhv/CI08Vxw2JencA8ASqBTEbe+NAGwVmyZ8/ZKlBFCXJT51p/YmRfYxHls2BxNxhbsUjhFZlxo9bUstg8Y5mOmxCWnuPi47RoaIBRJa0WQoM29+UyhtQBTGWjxPFG60VCCcZuOCG30A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=phGd7+kh; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="phGd7+kh"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84e27035206so3133407b3a.3
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184873; x=1785789673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7r5DtL0sBQKxu51vWXlifLkndvEzBXXj/6XC44jQqeo=;
        b=phGd7+khM+4p/6gWgYo1+kjMkPZ9yVuZqqQJjgpaNfC2ZTSYp/Ik29KL1TNgPVjzlf
         pLr9ELUzmP8fN+GAW927truFv0meoxxeZ1AflAcY8bZnfLRLMD2C/YsghCIGhy3OjqBh
         t8ZVn5k1V+kc4OUaCzEQT0ULdCAS62Vl+zD11pdXa+DBIPohqNd5GIrh08LcN5Vgi8+v
         1YHBhp1AoJscXKmCy7pmYvLhSDv0PnA3MSEe4mRNqp7jjGzt2e4tosZIs6OoweC0Lj0O
         gQVjrA8uqlFm2bGPF0+m0eg8JM5n+TsNiS3/Oh7ZRcrSTG6T+ym47o/U7nnQX+rJyd4C
         JGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184873; x=1785789673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7r5DtL0sBQKxu51vWXlifLkndvEzBXXj/6XC44jQqeo=;
        b=Au/D8l6eQjgI7QZzyXGxTcnJHx6j23FfCksvIh8q/mo/AIv3VHeDft6VKIKbHQA81j
         3fwWK21rzZjNMpgfVS4uG+M4uPnNfXj87t0nHdUeIZI5Lqc/4g5qnl0IgL41Zm54R+tI
         noAiiVzTqXRxZWxIcmh5fHnFykw8tvHkFQgeK2rWkZr33dXPwagni+LfeDHWorWcgXdn
         iYGToMB8NG5tke8oz6yVeIKQXvPMzjlsAaDBEA0XESu4JwZl6mQ/MnAzgp7FasLHwwFA
         lVlCaefxzPHPeH3/ZtIT3skD++QZLR5j0jp/tWWcpeCtvuyktXd81q6FyHLY7CKxMp1t
         pGxQ==
X-Forwarded-Encrypted: i=1; AHgh+RqzJtg7/lXzzre13SlDjHxm2IPSEbZzSCcfAyw6IKs87Y/t39XBapk/PZb4KTlzoa36Tl5no9ojbJk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTsEfzB65RBg5F8eOuct3p19r132X02jSXfCYzke8iiyo8Byyl
	UkIo4bNiO9TwoCfrSfMGeUn/nAr/CSjoBeOcPyjeZjDZFxhkFwN8EfMM
X-Gm-Gg: AR+sD101t5DCeRr7KwtnzZGcHXZ7Q0/eghwLtj6kQyy52jkd6PRbJzUqU8wP+4hGei0
	6zNud90+LLJPmVCWJm6mjomijrn+HiIp3O68ZEYz+F9JKMdUawQ22krcSzPQaPQMV1NrgKJfzR0
	Lp2RPKyXVgtFcXRShoT+tmGghqvrEYvQdeZVepwLDD84KuSNjlU6beYr7iC5BwKjfZZV1s/PMPV
	lFWVX2bp/vRnBnPO6Bj/XDP8f8GD6Dj10rs1lMouL4rC2Oqr4HcLpVr/qqlC8qZCyunGNw7c9D0
	mF7iq+uFwuIhrAJqHSWKsell3HUvQrHCWF1slX3pMEXgzeWTwepLwKluI6rA6llJSaE+BnkoSRd
	2gpx0U8UI6kPn51DU0a/bxaLQp62X8NvXS9G+F/m6/MWSzd5Na++I3fPAAUtNZKIY7EBl6WksQU
	NFRozpwj/po6F81OE=
X-Received: by 2002:a05:6a00:9a3:b0:84c:539e:a355 with SMTP id d2e1a72fcca58-84e8d12951dmr861522b3a.74.1785184873509;
        Mon, 27 Jul 2026 13:41:13 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:41:12 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 58/64] dmaengine: qcom-adm: use dma_chan_kill_bh
Date: Mon, 27 Jul 2026 13:39:20 -0700
Message-ID: <295b8a8c7e6a8e3da7a7eb1f632906569c5ab87a.1785183549.git.allen.lkml@gmail.com>
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

virt-dma now dispatches completion callbacks through per-channel BH
work instead of its tasklet. Cancel that work during teardown before
channel storage is released.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/qcom/qcom_adm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/qcom_adm.c b/drivers/dma/qcom/qcom_adm.c
index 07fbe32d31fa..ea24e2de5154 100644
--- a/drivers/dma/qcom/qcom_adm.c
+++ b/drivers/dma/qcom/qcom_adm.c
@@ -918,8 +918,8 @@ static void adm_dma_remove(struct platform_device *pdev)
 		/* mask IRQs for this channel/EE pair */
 		writel(0, adev->regs + ADM_CH_RSLT_CONF(achan->id, adev->ee));
 
-		tasklet_kill(&adev->channels[i].vc.task);
-		adm_terminate_all(&adev->channels[i].vc.chan);
+		dma_chan_kill_bh(&achan->vc.chan);
+		adm_terminate_all(&achan->vc.chan);
 	}
 
 	devm_free_irq(adev->dev, adev->irq, adev);
-- 
2.43.0

