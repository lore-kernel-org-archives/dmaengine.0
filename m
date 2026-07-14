Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4918244BC9A;
	Tue, 14 Jul 2026 12:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784032584; cv=none; b=lWtFf0alaIBBcDdYuda3aiioVtMEH+bDWzcFibqtfbNY4uIGjnt+naL5C8WMD7GSAfyunAvON/xgINpvEdvpxE/C4brZjVtiZDIorzu2L9y2NGdm1FanG13myhsWHlxMEB9kKU3sJ1P1WoFCCOEDvYFIfk5UMEzHYOd5TNKI4Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784032584; c=relaxed/simple;
	bh=xOMxbou0HtgU77LZY2/yUrdmKJDz90GT+92DNpGQ3uw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BDSAb/9+sN5Ks2rzzkh84Sqw6DMuG8oh3p2mO/mGf0bLZ55yZH5N7ZvWmv4G2mYB7qAjZUBgyLQ/VNaEsryA1qOdm+TPb91CBZN9XZ61n2j0PXGmm8HaHnOtxrmM8jIqpVudBHmtW7Hnb+RlZM3QeJLNafYXZNwzPg/1iw+jKuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GtB2du4z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GtB2du4z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFBFC1F000E9;
	Tue, 14 Jul 2026 12:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784032578;
	bh=62Ak6hz9EWMUawwBjeZokrMky5PP5s9D1N6X5kDoKJE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=GtB2du4zHdAofRkgaxtK3OS11QR9YtxEdQSOrLt87xR1WngDqN8k11fkrH8eCSb23
	 ENaTjsBtj4q5M3uXV4L9AwchKqFbC4m7p76437YsE38a8XL0NpAiipiF9VyuLaSSbN
	 LMuTwA/6lpAuwE4GwEskB1JnOTdbTr+VB98Jgxsef+r7kS1KmrETMFtxlSbhPUzNLq
	 DIW2hKOm3PUdBhiJ46SC25M6LOLzqeb2Iv1tKf1pGVhiI2yw0XO2JK8pYY5PpwisGw
	 JXwxiJWKOQgqAUQdikJYo8n+jfa+JLZahJDNHt7wT/rlU5vTOQypuiYaBeK06tJoGI
	 cdsNvoAfY4iaQ==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Griffin Kroah-Hartman <griffin@kroah.com>, 
 stable <stable@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 imx@lists.linux.dev
In-Reply-To: <2026070605-frying-fling-b9c5@gregkh>
References: <2026070605-frying-fling-b9c5@gregkh>
Subject: Re: [PATCH] dmaengine: fl1-edma: Add error handling for
 devm_kasprintf
Message-Id: <178403257631.822807.3647660559296965382.b4-ty@kernel.org>
Date: Tue, 14 Jul 2026 18:06:16 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 06 Jul 2026 16:57:06 +0200, Greg Kroah-Hartman wrote:
> Add error handling statement to fls_edma3_irq_init() for the
> devm_kasprintf call.
> 
> 

Applied, thanks!

[1/1] dmaengine: fl1-edma: Add error handling for devm_kasprintf
      commit: bf1af4dfdc017dfe989c0dbcf0e608dc95f1d2cb

Best regards,
-- 
~Vinod


