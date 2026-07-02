Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE8B3242BC
	for <dmaengine@vger.kernel.org>; Thu,  2 Jul 2026 16:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783008232; cv=none; b=AV524fy/xT/1Cqjb1gYM0a/YrY3gJXs8jH1H7MmYVQ5pzmrbKbcOy9NlLzDuMEPH+UFQwpEqM5rYqu9DUBYL3odAYReqxN9xNBAW1h+ZURECXGWVRdO70PT76qSR0+0Xn8Fmf2y72SH4A0NuyahFAMoF5+ydPrI+4tIavZUBS0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783008232; c=relaxed/simple;
	bh=nEul18I5MldvqlFcrP9QWyte6ZI6AuOd18zhVdIXJA8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=e0Wcm9CvuAFNIm/zgJs1XkSHLjX7jRtZHrmQcWS+rdYv1JcnEscsfoWV0BH16Ji5hVBNZF/q5+qN9IORZMZVJmJWzfjj+19KDCHJMrPUhxpri9NBID6zwu6NsiLKmvsye8OV5wMhde5e/R1T4z0pHQVMYFlujqBEgp638iUvyc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gEBmqItC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gEBmqItC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DC281F000E9;
	Thu,  2 Jul 2026 16:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008231;
	bh=fN/+c184JJBkP+Kubh0STnQ/01/ooGVRgaPIa+dzx0c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=gEBmqItC1jZkuXhcXRaHtN8N/KCDkphgPbRAAcyOHepxM06TcgtpcL4g8s4nWRmqn
	 Xl5q1reZ17YqG6YlcbdSyEEGJVsKLeYEEqmFf68++8wPW23b0QZMRiC6OMZuhsxQEh
	 BvSztJ6we/duL1JVuYzPriWH4t4g9Eyvkw55BHLZQYw43+MAx5DWFlFfmLFir7vG7n
	 fP4U3uRs2fEDeobPw82aesJ2FKMYBYP7A7pp6QTeV3ibS2iwtQDYvM4zko5lxgsjSj
	 5dUHNy1yXeK9l3XFHKWjMWTDEO8vE7++Fx1D+yhHUB4RK0Tf9zloM5Yk5JCNIE1KYR
	 z5neKGznOTdqQ==
From: Vinod Koul <vkoul@kernel.org>
To: Zhou Wang <wangzhou1@hisilicon.com>, 
 Longfang Liu <liulongfang@huawei.com>, Vladimir Zapolskiy <vz@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>, Zhenfa Qiu <qiuzhenfa@hisilicon.com>, 
 dmaengine@vger.kernel.org
In-Reply-To: <20260630144214.4080302-1-vz@kernel.org>
References: <20260630144214.4080302-1-vz@kernel.org>
Subject: Re: [PATCH] dmaengine: hisilicon: Return -ENOMEM on dynamic memory
 allocation in probe
Message-Id: <178300822927.756665.7017607086496061232.b4-ty@kernel.org>
Date: Thu, 02 Jul 2026 21:33:49 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 30 Jun 2026 17:42:14 +0300, Vladimir Zapolskiy wrote:
> Out of memory situation on driver's probe is expected to be reported to
> the driver's framework with a proper -ENOMEM error code.
> 
> 

Applied, thanks!

[1/1] dmaengine: hisilicon: Return -ENOMEM on dynamic memory allocation in probe
      commit: cbabdd6ce1b313b5877c7fbb2f5e2f7936564d2f

Best regards,
-- 
~Vinod


