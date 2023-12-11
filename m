Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39694A990;
	Mon, 11 Dec 2023 15:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dh7n+yPV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF0EDC433CA;
	Mon, 11 Dec 2023 15:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702307044;
	bh=IS71Mp58hMCONwHAoN/XApcqnwXk3hCgJYnY8rGP6AE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dh7n+yPVniUiVcybjGYKQd7D9SFZwXSwgK50SrM6magUpuU+iqvw4UQrZoYGV1zHO
	 mt7yPjFeURUUFdYDnImdIU4w3jDHmRclsj39708TJJ2S1czLvGeLwySOtcFPf6kFse
	 ueZJGi8lQ1r2dEMc/l2PS6Z1xCL5OWWjAaQxf747OjOlmiZ4oGcEIuw90vMmWhphuh
	 RmjJJwP8cS0sau9vX7Emnm7x1nJYESoGcwvxwtD+2YLmgSiVOyS241dNGKdxIjmKi1
	 cXPFPcLQNi6eFc2HxLbePDk8vMOIu8NQ3MqutlJc5/3orJ0qILXjaJHv0S+XSnOEgd
	 n16kZPotwGNhg==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, imx@lists.linux.dev, 
 Yang Yingliang <yangyingliang@huaweicloud.com>
Cc: Frank.Li@nxp.com, yangyingliang@huawei.com
In-Reply-To: <20231129090000.841440-1-yangyingliang@huaweicloud.com>
References: <20231129090000.841440-1-yangyingliang@huaweicloud.com>
Subject: Re: [PATCH] dmaengine: fsl-edma: fix wrong pointer check in
 fsl_edma3_attach_pd()
Message-Id: <170230704241.319897.1659664666361924677.b4-ty@kernel.org>
Date: Mon, 11 Dec 2023 20:34:02 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Wed, 29 Nov 2023 17:00:00 +0800, Yang Yingliang wrote:
> device_link_add() returns NULL pointer not PTR_ERR() when it fails,
> so replace the IS_ERR() check with NULL pointer check.
> 
> 

Applied, thanks!

[1/1] dmaengine: fsl-edma: fix wrong pointer check in fsl_edma3_attach_pd()
      commit: bffa7218dcddb80e7f18dfa545dd4b359b11dd93

Best regards,
-- 
~Vinod


