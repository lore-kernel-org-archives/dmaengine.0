Received: from www522.your-server.de (www522.your-server.de [195.201.215.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD8F372EC8;
	Thu,  5 Mar 2026 08:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.201.215.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772698946; cv=none; b=pGQ2PpFI3em/6j8BXPf+ta8fkk1gV7N41WFyI6epBslMRgodu/gHzfnAQ1J/jDDv+qM7Ih6JNYmU0Bm+Z6AC8zct/HS6q0/5nbXdS57Wb8SvLfNdLrNqLNGPO7e06n1LTW6w6zdzu1x7Uq/EsvJP9nEAgzRrKAMBoh5Dz3xeEwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772698946; c=relaxed/simple;
	bh=pBScHLNaA0wdLEmdGRRYgxORxoOpvTuWSTnHf23J7qs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:From:To:Subject:
	 References:In-Reply-To; b=A7JWbZ+fxPXRvTZt9FnI59lVBnvh6B2nvIYqmZDlcKwdLCHVD6lN0argkQrkPq3zDf7dJOeeOTiETn+yhj5OswHAI4uhK50uX0TFD9Jhs6H8RYTCcu8Lm0xLzUdN8VUMCNbBALkBGQpmuWPP57pM56aM01se6Mnm9TsdVDrzX/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=folker-schwesinger.de; spf=pass smtp.mailfrom=folker-schwesinger.de; dkim=pass (2048-bit key) header.d=folker-schwesinger.de header.i=@folker-schwesinger.de header.b=N7ckOA5P; arc=none smtp.client-ip=195.201.215.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=folker-schwesinger.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=folker-schwesinger.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=folker-schwesinger.de header.i=@folker-schwesinger.de header.b="N7ckOA5P"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=folker-schwesinger.de; s=default2212; h=In-Reply-To:References:Subject:To:
	From:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=pBScHLNaA0wdLEmdGRRYgxORxoOpvTuWSTnHf23J7qs=; b=N7ckOA5PvGGhfD5ARt8UGTggqw
	1ZoGqceAJUeBLloaGo42EXrKoOYDL4J4AXdHNmuFEJGO2raqiH/eF9pznZGXjouAJ1qvh2StYr3dt
	CGcS1/lTM+d/h4K2Op4O5Wxp33mjoG6HYNnSBiMCcIGWwW7MKHDHHa0Q7+TUZ5nmLOrZQ+Wddfjyb
	jyOoV/seyinVVp/+uObtJBDgxupfAgssp1zxg4nXDQ/6zucLZbAWDjRY72XBVybViWg4VspfZd8yI
	PRqn6EK96xIDTixuDOaA3FBd2dAvgF0HljyaVVSvYCAqs6MSdYTCnCip5RGweuBmJVGWqBgBpXyWL
	ffFoO4NA==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www522.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1vy3y9-0007io-1E;
	Thu, 05 Mar 2026 09:22:05 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1vy3y8-0007JE-28;
	Thu, 05 Mar 2026 09:22:04 +0100
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 08:22:03 +0000
Message-Id: <DGUPBMTFOV1E.EWJ7UBJFIDO6@folker-schwesinger.de>
Cc: "Rahul Navale" <rahul.navale@ifm.com>, <dmaengine@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
 <suraj.gupta2@amd.com>, <thomas.gessler@brueckmann-gmbh.de>,
 <radhey.shyam.pandey@amd.com>, <tomi.valkeinen@ideasonboard.com>,
 <marex@nabladev.com>, <marex@denx.de>
From: "Folker Schwesinger" <dev@folker-schwesinger.de>
To: "Rahul Navale" <rahulnavale04@gmail.com>
Subject: Re: [RFC PATCH] dmaengine: xilinx_dma: Fix per-channel direction
 reporting via device_caps
X-Mailer: aerc 0.21.0-119-g0a449d4a7ff3
References: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
 <20260305072310.5525-1-rahulnavale04@gmail.com>
In-Reply-To: <20260305072310.5525-1-rahulnavale04@gmail.com>
X-Virus-Scanned: Clear (ClamAV 1.4.3/27930/Wed Mar  4 08:24:08 2026)

On Thu Mar 5, 2026 at 8:23 AM CET, Rahul Navale wrote:
> I applied the residue_granularity/has_sg gating patch you provided. I kep=
t:
> 7e01511443c3 applied + RFC patch(xilinx_dma_device_caps + printk) +
> dmaengine.c debug patch applied (dma_slave_caps_printk() + dump_stack()) =
+
> all caps assignment in dma_get_slave_caps() enabled again.
>
> The audio issue is not fixed. Playback still fails after the first buffer=
 period.

Could you show the debug output from dma_get_slave_caps()? The stack
traces are not needed.
