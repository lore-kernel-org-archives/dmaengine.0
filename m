Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAED04CE672;
	Mon,  5 Oct 2026 15:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214993; cv=none; b=MHTDjPTPySx9MvoNeMgxRBs1a0K81lgYU2Fz02ob7YqaanVbbwwv7Yodvpz0v+mjYL2TqEiDlaxhrYODA3sbweaFGvgGf1x9/SV8/dptKV390kijwGMaRvnl5rxf+HeAemd5n9/tzxXuZwtjO0VcX5njDb9k4iypDlFPSgFPsN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214993; c=relaxed/simple;
	bh=KbcivJaFVCHeHq1QOF6j5TUN3+TPRNCszzaRMZAXVdg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nj5FDtoDb+srIPwMM/Sax4U1UdZ8GMS+ezG7XOhAm1GPGzRWb3aAi0oRSSzwKAOp0JiI+QDWPsiYCJ36r3SiXSdKYRZ5BlYF4+/h5GeU/SyKpwWA6R+Yl7r84qLsHYqxgjDVr/0djwJf1wj85vE6W0cP858lr2HBh4yEejS1ZRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HKwHcy6Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HKwHcy6Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 954A71F00893;
	Mon,  5 Oct 2026 15:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791214992;
	bh=cxFHPfiFtEk2g7AHXHznH1h9Lu20PA/qFm29c/MJiJY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=HKwHcy6Z2nbEv5PEfXpbSDIsEUEEWTG9g3Irmoc3saHLmBjxXlFH/eAit0LdQE6PE
	 gh1DprFG16uLXIq1694Yvsr/A9EioO3FPR+fmXqYMqpqCCScPXH2q2B9mJp/6BaStR
	 rZ+QGZpf5aBlLX0UB2TCrzK6ZkBmSIfxw775vqVfvTuPtMxOSok1mXkKf2wQ1qBp53
	 qqbplUwWFgveQF/BrX5/HO/ppBrCXP2X4l6O1UWg697UJo8BVernKIUqLIngBsN6pU
	 KPsIvIt+PHv6ItmUc4vagfwWco3FmQxlJ1JBxZ0H7DsNW0oThLtaL91z/PRseNaxLN
	 tEJwLnYoCD7xw==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20260911220308.176962-1-rosenp@gmail.com>
References: <20260911220308.176962-1-rosenp@gmail.com>
Subject: Re: [PATCHv2] dmaengine: ppc4xx: change to %zu format specifiers
 for size_t arguments
Message-Id: <179121499123.358863.16661497693402011472.b4-ty@kernel.org>
Date: Mon, 05 Oct 2026 17:43:11 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 11 Sep 2026 15:03:08 -0700, Rosen Penev wrote:
> Several dev_err, dev_dbg, pr_debug, and printk calls use %d or %u
> format specifiers for size_t arguments (len, pool_size).  Fix them
> to use %zu to avoid warnings on 64-bit builds.
> 
> 

Applied, thanks!

[1/1] dmaengine: ppc4xx: change to %zu format specifiers for size_t arguments
      commit: 7b6aa7904aae77275e4e8e8c69ce8826dc301fa8

Best regards,
-- 
~Vinod


