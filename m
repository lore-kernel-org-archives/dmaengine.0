Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354573939CE;
	Wed, 25 Feb 2026 11:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772017364; cv=none; b=J9xT17pTa/pzJMU6vvmwO9wNbzY3rsm76LH1YIApTqISxdUzi+3j2P0bLEeuI6nMQVQ6F5DfbeNVGhiMJuMgHEuaWGSEd4m2V2rL4AmOZJjW6fGoBAXmItotSTtIUkbSRBaD0IOzxOLZOwjeZUSrOjteukNXzmm2yCJN30qfaQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772017364; c=relaxed/simple;
	bh=jxUZXv5AEIgoCAqC2oLUc72J9z3rVIlERiOeuV3zWlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PiR6Majwz0PLxUWatvwmUMZ4bSHytVaiRPsQL236+JPWvaXVR7SdiLffPITP9Ry8Uv54+C/kw1tuzRVVToRgqEmqvOoPS5J7MLAaEVBx7RQULqfIWDh6D7t2fqRJmT9m4N4Z8UzpT5zGiVj3P4gyqnBl9hAQG611/NgbVWzS4Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YSlypGcB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YSlypGcB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E1F0C116D0;
	Wed, 25 Feb 2026 11:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772017363;
	bh=jxUZXv5AEIgoCAqC2oLUc72J9z3rVIlERiOeuV3zWlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YSlypGcBBpeSvXZjvmXiWug9zICKG/3dUHP9XsxpIoSNZvvEF3iT50xFNIPBld61e
	 UDmGpXpd3MjMSqgMCHfSxerf9RRMUug75fBWrdyJmBosRPrTjOW4esdnlIZFVhOxUr
	 ETC1zDqeLtRDVsa42QS81wzYG6N5pNfTDAmNE69ZvNdNJAFvGeAbh55gHj2c8VBV4v
	 ldNNcuMJoLh23VFgkX2LPOOfKWeqZGObTeIcCdv9QDpp2O1Z0mNeEQSPv7RWLqO8/9
	 CQaDbj27kGID8YBlAvSDAH4bgWY84CRhMM1xOwRZVT/V4F8sU/R00ysGApVMk7PbY5
	 wZiC1+zqr2C1w==
Date: Wed, 25 Feb 2026 16:32:40 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Shi-Shenghui <ssh.mediatek@gmail.com>
Cc: Frank.Li@nxp.com, manivannan.sadhasivam@linaro.org,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	brody.shi@m2semi.com, kevin.song@m2semi.com,
	qixiang.zhong@m2semi.com, tom.hu@m2semi.com,
	richard.yang@m2semi.com
Subject: Re: [PATCH v7] dmaengine: dw-edma: fix MSI data programming for
 multi-IRQ case
Message-ID: <aZ7W0KxKifSyOAG3@vaman>
References: <20260209093642.273-1-brody.shi@m2semi.com>
 <20260209103726.414-1-brody.shi@m2semi.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209103726.414-1-brody.shi@m2semi.com>

On 09-02-26, 18:37, Shi-Shenghui wrote:
> From: Shenghui Shi <brody.shi@m2semi.com>
> 
> When using MSI (not MSI-X) with multiple IRQs, the MSI data value
> must be unique per vector to ensure correct interrupt delivery.
> Currently, the driver fails to increment the MSI data per vector,
> causing interrupts to be misrouted.
> 
> Fix this by caching the base MSI data and adjusting each vector's
> data accordingly during IRQ setup.
> 
> Fixes: e63d79d1ff04 ("dmaengine: dw-edma: Add Synopsys DesignWare eDMA IP core driver")
> 
> Signed-off-by: Shenghui Shi <brody.shi@m2semi.com>

No blank lines after Fixes tag please. I have fixed it while applying

-- 
~Vinod
