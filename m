Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8955A5FDA7;
	Wed,  1 Jul 2026 08:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895600; cv=none; b=ihgJL6E8lxaR91QAYS6xEw+ErMHmsY1qAI1LhVLjB+WlPKpWjO/gylNZuyKSGhkV0dJ9TrL6CY09DiAPEIXLXtK45neqp+y8dCpDojUvqUDWQ616Aj4R2yhxi/xBWX/9lkcI2bRo9ueze10XZS2IVv2lAQGYllBYsdC96Cy4yBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895600; c=relaxed/simple;
	bh=C0RbXQ8kRWzJwgtFJMB15xNRhY6aNbAMPpWBryzPlXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YQpis9Q/gDAxhRIHOxDfGpPnrbHXUsziXpisCZOpO0tg1V6TvVeOhwONdQ7WyA7AvyXHwzqYIrcNS31go4gKLkQE2zeBpeHYLFFN1WFa/0Ykefhx1USmMVumOvljrZG8ITIN/cl4DwVPm9kJSj5Z5+S12MzGSttSoH4ynbvx4PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D1iUBD95; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D1iUBD95"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C9B81F000E9;
	Wed,  1 Jul 2026 08:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782895599;
	bh=+FBXMR3yiiIwAA5txG6AiPm9Ran8YbRcDPiawHSeJ74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D1iUBD95PYkiqJNJcuRvQJGsEDc6swRGCwG5k80LksiHTSwfEtkntky0fZkimtc6I
	 t1IVNNIG+XqGkLFISqlyQND3Iy4ZF5GYjqC8DuEYm0Y0PTBtkF7Hd61LnhcLEKVijP
	 8bnaTA0z6M2UCVeyMcr3PuBLBoT9KEPaj9mZUlEzcDHkzrMs+SZQ0jtqucNfqlBxi8
	 m6Z2h1v3+eF28XZY/coXM1vaD1ta9EGwmLQ3TKRBuu95ZFTWwDFi/0NCx1DlvYEBZH
	 VyIRTg6F4NgsLro7r9xFBGVAhIyDiP7LASVg/va3+peMIaG22lO6X/IkQS/ynM60E8
	 1NTIxfHcxcPpw==
Date: Wed, 1 Jul 2026 14:16:35 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: "Verma, Devendra" <devverma@amd.com>, sashiko-reviews@lists.linux.dev,
	Devendra K Verma <devendra.verma@amd.com>, Frank.Li@kernel.org,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH v5] dmaengine: dw-edma: Enable HDMA 64R/W Channels
Message-ID: <akTT639rZ712TZ5t@vaman>
References: <20260626132151.1875965-1-devendra.verma@amd.com>
 <20260626134641.87D161F000E9@smtp.kernel.org>
 <3ac6b44c-febb-4c20-a737-aba34de5c208@amd.com>
 <aj6iIr61LI9Sm10h@SMW015318>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aj6iIr61LI9Sm10h@SMW015318>

On 26-06-26, 11:00, Frank Li wrote:
> On Fri, Jun 26, 2026 at 08:56:35PM +0530, Verma, Devendra wrote:
> > Hi Frank, Vinod
> >
> > Do you have any suggestion about handling of the repeated comments from
> > AI?
> > On every version of this patch the similar issues have been raised and
> > I am replying with the same answers as many version-times.
> > Please suggest so that multiple replies to the same queries by AI bot
> > can be managed.
> 
> You can omit pre-existing. Only reply once when patch close to land. I hope
> there are tool, which can help identified comments and pull your previous
> reply.

Right, fixing preexisting is indeed optional but since it may impact your device,
we are looking forward to fixes on these from you. More important for us
is not adding new issues.

> On method may help:
> 
> After I provided review-by, you can reply you already checked AI's results,
> so It help vnod offload his checking work.

Thanks this helps a lot.

> AI is quite new for us. we are looking for efficent flow to handle it.

Just like any other tool, it is tool which helps us. People should also
run the locally as well.

-- 
~Vinod
