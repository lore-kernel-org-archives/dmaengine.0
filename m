Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7813F44E2;
	Wed,  8 Jul 2026 07:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783497470; cv=none; b=n8phjW62PedZUntFLAUh63qTKZSP1UUEsBQpd/ZpqUDiUm7WyX2SekGICWl8wZYjFw2vHnEP6OmqrezIVP1FUB3rmd8v+n070b57CVtAik5GRCqB4vDneXcfez9OkmXYgneWmebXII7X3rBV4Q7XEbLyR0eVyY8Cng6hs/Ig8wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783497470; c=relaxed/simple;
	bh=LTHXyXxiuHFlOCI9YGIZCpinAE0mZwD8ebAgWOVL/aA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kMhmNR+NyxQJDKEq1AbeajZSL10SP/CmD+IDoIaYgH4jsDSsx4HSqvic5R+iooSRGtqvU7CsSjtUQ3YO/GkznZKXEdxkCJGPujMWIQviyN0qPuVGWjRoFQRBed3fymootANym6YG1suQnzopIJXXCnhmG22tcCi6EdVOzd8f/1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=Bio95qNI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=anNLw0Id; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="Bio95qNI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="anNLw0Id"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 2EF6AEC011D;
	Wed,  8 Jul 2026 03:57:41 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 08 Jul 2026 03:57:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1783497461; x=1783583861; bh=+QWRbM4Vxj9YyyrM01W7N
	FIg80gms5TS2x5ulqaOcV0=; b=Bio95qNIlb+NO4KvALttF1N3hzmMWv5Novtsr
	9UR5BSaUUEv5VYaukp9ZIXtUR4IvficdtBDLPc9xk7+dyve7qa0zrb0P93SQQtmN
	sNvV9+lFb40DT9JvOiDVcWzeaOWq6qYOXmep1eWLcGqgwBW8rQ8fNRtXryk1dyA2
	OVOeNbXYzI+M3kE2Gb7SAGaCJWE14D+/yp+QslwrpNs24qJx/LCA4/dZ8w4j1xrI
	CRyJ4tArUkV6WXQPQWYxTVtaRXHTNr+625XiU6nZK5OcdeivBApRVFluzT36IyUj
	cCCWz7YAbi1IZURKXRK4mvVGmvnT+s91x+tSg43r84pcqzCmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1783497461; x=1783583861; bh=+QWRbM4Vxj9YyyrM01W7NFIg80gms5TS2x5
	ulqaOcV0=; b=anNLw0IdgtMhEjFprXCuq0RyRDUh7Q7tlONx0nfNEn2hReuAiSU
	rIw20PZGSvM5jPP7lngmYiAUvHFZIQGwSR2KRAdo9JAtBheTXWb+2MW5tvF5dpoX
	dhbSMUR8r0JbcucNVgefY+B18e6XQAWfx1R564GpjIl4eH0yEgtLJrdfcgugU88R
	KkD7IrVZC3vDO3Gy5gpClIy525BWVRnvmq2lbwdJ4aH7inKiLOKSc5htsiXpkq3t
	aQmddXzf7y0+sxzGfHNWYSY9FNPyEJHK5pGbDc/6iqAfiAXnqVlaQ8XwwEzQn0Yt
	y4xQXenjeVc8rawNRIqwrh1NLUD0xfJDy6A==
X-ME-Sender: <xms:9AJOahuNURMoE0WUk4unbc9xUO-B4b3CO8ku8x43n9z5TdoGv0lXHA>
    <xme:9AJOamdUG97m5O2CG3DHDuQ1BOKCGLLBsr5FJXxqBqVoDyS9k2vOnuYG55UyWkNr_
    1rUvWACF6rHjhv3foGlyL1z7JATNR6dEXTNYWrZzgOMSDFsBSE>
X-ME-Received: <xmr:9AJOam_KLsPaVQQvQ1v66TwrdnXDaLFRQMeQU2MspzrQV3oSnoHN9I8HeN-hhY8kBjat-LCVUbYpfI2YUZxlbkrVb0eYLdoFSAQ>
X-ME-Proxy-Cause: dmFkZTFKIiOsP3Tg2LL7ABQtC/fQSvd1zzU1OrsLY1qkRK9AbxR9WtzX7M5tvieiUDhIuD
    AjrikhzZzNBqWYcZuryXlzz3+dkO1Lf+6dy6JMa8Ml8hZgankXOsqVC2cejKvwei0t7Fhx
    H+hdj53MevdYdbFhe1fk2bxcuQaUUG9i/9G/65gX+7Yg+Pne4+YgkGZHFtYoTU21bILXhv
    QM4GuHi+5AMEocP67MAuELdjJIhCKx1GqOq7jMVKXAP+WEUyUBuG7qf/Anz0UJG8Gk+pY2
    mp2OJyiIavocouPpk5a8CnP5zylWfuUorqYZJ26Olcjeicg/4RH8cxxkp3Dv1BMyCnfqIa
    cr1JEiGLz267nFh0awNqoKGEPEvQcDBCYdfA3CJJNdqKYuDr7ZUK2sDCbeWzwOaHPUx4My
    SeooCFGc6+mf1enEbhejam+0K2sNw2p3Oljs7Cg1tUOCBNHPOvkcTQ1CjarxvsAeVJ7UvP
    NwvuLXaQblt1AZUEr8bNKrkHjgVTXlxjUgS5j/4VXxBvQpmTV2yPSQFepnUKC/pZWXmWQE
    s8wcoshhDK7Tq+IF3QhocnJpcUlCOUR8xYur4kU0AhtC+f91uoFS8Udy3G9n0+7nzgokpC
    4bJNaoUi8H9LnBQ2KTroSLps3IQFjaljhs3YsXkQkxJg9mrNu5ENqaOA9dXQ
X-ME-Proxy: <xmx:9AJOapTL0zfAzOsAV0v052o2XZ3CnptMSCALy0zZ0vi-6HsWA1oyEw>
    <xmx:9AJOavp6opkIar7cMDInsKjt08UEcgMEgwEIafWkogSmMGYdkirJyA>
    <xmx:9AJOaumtr5xo8cTjIuI1Pa1PhTHPr3jRvB7ULbQnWxuIxdSXBlTY3w>
    <xmx:9AJOageSWG9efaKiWc6X6we9T1kP99QdrxN17K0LrEVb9ymKKXp4pA>
    <xmx:9QJOapFW_9U_cdxpfkEFxlj-AnDmpjRLI-nXIvMxhC7TU_QpXemHWMsT>
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Jul 2026 03:57:39 -0400 (EDT)
From: Griffin Kroah-Hartman <griffin@kroah.com>
To: dmaengine@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	stable <stable@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	imx@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2] dmaengine: fsl-edma: Add error handling for devm_kasprintf
Date: Wed,  8 Jul 2026 09:57:36 +0200
Message-ID: <20260708075736.47822-1-griffin@kroah.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add error handling statement to fsl_edma3_irq_init() for the
devm_kasprintf() call.

Assisted-by: gkh_clanker_2000
Cc: stable <stable@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: imx@lists.linux.dev
Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v2: fixed typos in subject and changelog text

 drivers/dma/fsl-edma-main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
index 36155ab1602a..d9fb717b5b53 100644
--- a/drivers/dma/fsl-edma-main.c
+++ b/drivers/dma/fsl-edma-main.c
@@ -414,6 +414,8 @@ static int fsl_edma3_irq_init(struct platform_device *pdev, struct fsl_edma_engi
 
 		errirq_name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-err",
 					     dev_name(&pdev->dev));
+		if (!errirq_name)
+			return -ENOMEM;
 
 		ret = devm_request_irq(&pdev->dev, fsl_edma->errirq, fsl_edma3_err_handler_shared,
 				       0, errirq_name, fsl_edma);
-- 
2.55.0

