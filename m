Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4283446BE;
	Thu, 11 Jun 2026 05:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781157103; cv=none; b=DR53ojq8ygnEBwuB/FlV01EF7k+nUQVXUMfhWDVTkrtea394yZ5WiOyPxplpRPrHevUyB0k7qLMOWQmKpTHs+UrDTpXbcwaMdi/+K7fy3qpydF9U+r5y5wDAKCw5iYGPm0sHeDuznbA+10P1dpLMVHqyj+/4424kmp80T9kcDh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781157103; c=relaxed/simple;
	bh=WtWsOGOJFlEJPDZmGqLmhdV6iGjUWqZDyqekQoF1VoA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dUOzLW/BCpbUGn3SkE032RiHxqFCkig4it6VFNzOnopJT+OcLFh+ZeH+1eJ903ISGN/3wr6xwkAejbfym368AmGvBia1Niu9RvW1R3kPLVhgcg5ZX3Ws4xJMsFZCIvlsRnW7Ms2XoPMJryM/RpwMS/mZJRp1GqOpDDRUGvIRBUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V0RuXtNA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V0RuXtNA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 554231F00898;
	Thu, 11 Jun 2026 05:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781157101;
	bh=dO1hK3n2C4V3piQtMlFbU31mAhYV2p7vQwoh1h4KlX8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=V0RuXtNAyhhfRA+ALHWHTYh3oKJSuxDSFVhYoUrNiM+YDiR1HEC59EySkJjjDvwer
	 b2znceOnzNgpBFvb5HdfN3WCwJEB8oRr5TFU1V+xfSMUFr7W5znYkN5ISM2NLZmNgI
	 hju6KhzTkIpDCqSOJ7JTQFTscCXsfh6iIbIU9qAYVjoSdVZRBW3K/bqeqF0eZAXWBy
	 wISVDUbOJPUhx3FDVJMrW/7/OeqK4amNiQcB3IGnbOa2Dm4EeCaooU2x/P2UF+gNhw
	 AgxtxWGfiRLLGL4W5MNn+Uqt7fIswAbQZluSCCc9SmVPVHT9EKT8G8VokjxXFCmnWt
	 QR73GWT3QMOSg==
From: Vinod Koul <vkoul@kernel.org>
To: vigneshr@ti.com, Peter Ujfalusi <peter.ujfalusi@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, nm@ti.com
In-Reply-To: <20260505164605.15878-1-peter.ujfalusi@gmail.com>
References: <20260505164605.15878-1-peter.ujfalusi@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: dmaengine/ti: Remove myself and add
 Vignesh as maintainer
Message-Id: <178115709896.468137.15382584057699409343.b4-ty@kernel.org>
Date: Thu, 11 Jun 2026 11:21:38 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 05 May 2026 19:46:05 +0300, Peter Ujfalusi wrote:
> As I cannot spend adequate time to fulfill my role as maintainer for the
> TI DMA drivers, it is for the better if I resign and hand over the role
> to Vignesh Raghavendra.
> 
> 

Applied, thanks!

[1/1] MAINTAINERS: dmaengine/ti: Remove myself and add Vignesh as maintainer
      commit: 12933e2bc5e07e1500ee69821ab23ad443c3e649

Best regards,
-- 
~Vinod


