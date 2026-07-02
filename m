Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F483191D0;
	Thu,  2 Jul 2026 16:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783008240; cv=none; b=KF9IQEyTGQ7VEKwCWDceTcm6BzZkBvZP34lKLoaFIacigNOIk7WKYsVASBFxJfjvS3TPm86AmjHxbBnJeHp5h5Y6QyZx9a9aR8e0KhNSLeGCwvdRMYgXccBlQiSp6svmqIPpvjoaSA6bq5i8KIam0IB6IIpRzQhCFHWiEzvzU14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783008240; c=relaxed/simple;
	bh=6WCsBtauGs0jbSD0RozMlJ3oNpKF0SdumFnEHYhTqis=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ar1gKmoBSuvUM+WVYtFdRsdQbSjqCYXCfx/dbYrDAtgTQljIQrINBmfKMQYRrVmQJArHldKRmD/q5c+bUroakwBZQrnddIz/FrSSM7vfiEHtnTQuDfk/C3JAu5CgY5nhFQdKio9Z3Qf/7jS03Mr/otpKXzxKkSN63a14uVakmsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=baIPguAv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="baIPguAv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C66A51F000E9;
	Thu,  2 Jul 2026 16:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008239;
	bh=3fcl0RcQcAfXVTMYgP1q0Dyxg0wpJdAxTInm3RhLbe8=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=baIPguAvKETmAJPu7uefNbAGr5kxPDxwB5ztk/cp/4kt+1mPRTjcxCkyHOOYITAkk
	 nPobSMZSeaQZ2ET7EepcmF5TJsxLnOjn0HHv2gYhozA67iFQzfMqkdKLkvb6USf+JF
	 yR2PqejlxNSA2zsV/n7qbwuI4PR7MWKvQfilqjaq5BqnMBSXBRM2ea+DoHLdwbFh2r
	 jYmi6Ny1SsOtvdThs3m6ZFIzIn4dfbF77bM4ADKBKTA/UBR9D28KjLO4dRi0ibuS23
	 ysY/LHfh04iixsvZGliEkJr/9WQZQM+jhWHVfUC3bOMrizIG6M+MKbS5AlqI5pB0EE
	 clKGIIez/Z15g==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>
In-Reply-To: <20260615091645.28878-1-pengpeng@iscas.ac.cn>
References: <20260615091645.28878-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] dmaengine: pl330: remove debugfs file on teardown
Message-Id: <178300823744.756665.4078114802972621720.b4-ty@kernel.org>
Date: Thu, 02 Jul 2026 21:33:57 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 15 Jun 2026 17:16:45 +0800, Pengpeng Hou wrote:
> init_pl330_debugfs() creates a debugfs file with struct pl330_dmac as
> private data. pl330_remove() then unregisters the DMA device and frees
> the PL330 channel/thread state without removing that file.
> 
> Keep the debugfs dentry and remove it before tearing down the DMAC state
> used by the debugfs show callback.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: pl330: remove debugfs file on teardown
      commit: 0d3e3376b289cdaff5b3b6c1581999926ff1000f

Best regards,
-- 
~Vinod


