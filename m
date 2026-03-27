Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0FB3F9F46;
	Fri, 27 Mar 2026 14:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774623102; cv=none; b=d3aW/HXmYIdKu+6/s3t4dcQsGhcqb8g3lOi0lMD3tlqw6qaGBL8M0qDnMGP1KsjEM0BRrjCIXa0GkZId/+y4oBuFm6KCe6WrylcQ1oqjL2mJ3TNgXXnRxagAgCV8qWwwdldjTy2KvsoOEv4yZNBuGPSLvKywmV+M9dxqgGt8ees=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774623102; c=relaxed/simple;
	bh=zUP7MvGABnqxyfd47KtOgpw+MPjNKvgiGR7Jk3yn1Mo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j++7jJ78yngl6G2BqOuV9R1ePbHcURFq+48Q3xONQhwP8IwECEkDbcGGcvCOjSYZLlcRg8RbGHeVV5vdTTKTABKMKZ58lT44ahxoyBa62/njgQPP9cexijC6hFoUesbUOpGsTXzUTk2HlaEY9hN81WcAG7cehDO1zxMbKMTiFe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=OE69HoY0; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="OE69HoY0"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47989101589;
	Fri, 27 Mar 2026 15:51:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1774623097;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=zhwQ3iwD3rKe33JdbcyziY0LAl0yrH8VvKtX0KHIFPk=;
	b=OE69HoY02URaEnVSplB8hY3g0T4Iq2x1RvedSLyFZgHdTSV8YGHQWWEHP7x2ImL54/nQtA
	ixgQk7Bhbsj/xP3wmk7aWIAfT5kM/JHd33BHrh1qq5vVrE3kSNdEc1sG33GzntOuCegwh2
	IVJsKDxdKRMHFR2qXw948dCf7kwUhrHO/ClMIQhaG3cGlUx9FAmWt69AZO1sUjNSBmPE8o
	o2IPO/+rbh5Nn9XPhwoSiOYSG5GtBdEtK0ecTB9cbMAz/Vjptao+F8WAlgY9YJuPTNOSB4
	FssWUvmQQmuXxKkJz/F7akendVrP0+uyc2DYXNXc4bjUitH8JccB5Dt2Ovl4Ng==
Message-ID: <a25a1b42-5f68-4033-b8cf-d2e12d3de26d@nabladev.com>
Date: Fri, 27 Mar 2026 15:51:34 +0100
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] dmaengine: xilinx_dma: Fix per-channel direction
 reporting via device_caps
To: Rahul Navale <rahulnavale04@gmail.com>,
 Folker Schwesinger <dev@folker-schwesinger.de>
Cc: Rahul Navale <rahul.navale@ifm.com>, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, Frank.Li@kernel.org, michal.simek@amd.com,
 suraj.gupta2@amd.com, thomas.gessler@brueckmann-gmbh.de,
 radhey.shyam.pandey@amd.com, tomi.valkeinen@ideasonboard.com,
 Michal Simek <monstr@monstr.eu>
References: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
 <20260318123524.4959-1-rahulnavale04@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260318123524.4959-1-rahulnavale04@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 3/18/26 1:35 PM, Rahul Navale wrote:

Hello Rahul,

>> If yes,make sure you only test these three
> I have confirmed no other pathes applied on xilinx dma driver.
> I have applied only three patches provided by you.
> and tested audio but facing same issue.

Can you please add [1] to the patch stack and let me know whether that 
improves the behavior ?

Thank you

[1] 
https://lore.kernel.org/linux-sound/20260327143014.54867-1-marex@nabladev.com/
