Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1373F58C5;
	Tue, 11 Aug 2026 06:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786429928; cv=none; b=DSMkSFgu1CLzuXBZiIbR0yidOcpldMsyqoBmpsl4OF/L/CkW72fgw+WZTGTbU7nFmIIfjFLvUw20UI8dK1AIU3CJYjXwKfQeVOghw1ci0XgNECtFhbsj3zu5D/AZCo3AI02eMElWT2rZ1ngOz2Tp4+i1uGcPYDXCfscBqJ9cOFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786429928; c=relaxed/simple;
	bh=+2vloai21kJcvNruepnIeNVoUXTqACZMpGekBDo5org=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8txBy6WCTNj9GBVra67m6aOEM815lRkaI6OT4QdIqfGSkATLDuxZ/E9NeTV5Bnm5JiA+C39loQpxwYeOLvHryrAtPiiNxC/htC5KRpEbi7zNLlgH42h9nvdhx8w5iwRMPDsTnAUOjKfmrRQpFtFILo4qp2qnqOn/gA4U7hpzIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n5U7Criu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n5U7Criu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A651F000E9;
	Tue, 11 Aug 2026 06:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786429927;
	bh=GrxB0otAQBY6ovXkbbAgK9iW9B0zvK0R1w731XDGAnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n5U7Criu0cMqflxnnpV0TdIDv+m+9uk6645yRPN6yuwZp1q2xPLJE5cSQOPsOj7RJ
	 lyZ0DYJxDN5/qItnaUgRJI5vze8sJFgl0SYY7p19z274Xo4jjIJgvg+vjPBq3EVIAq
	 83YCHrLRzxOsmS8fpFhnIeCgSzRCnmb4h0iusPsVBN4L/uQDzDLeaDs/g1WHgSrSWw
	 puPwiu5A9VAFvJ6LchFz6CfYEw9rhISobPQ/EIO/fzUbp/v0TsWiAc9Zig2NadkSfk
	 OtpD+mdAtvtEBYbm+shFCnZnvGCdAQjx7GJf1pByLPAXZqKxKfgseeY2K0i+hsP8rG
	 7Sx8q417h/62A==
Date: Tue, 11 Aug 2026 08:32:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Cc: peter.ujfalusi@gmail.com, vigneshr@ti.com, vkoul@kernel.org, 
	Frank.Li@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nm@ti.com, ssantosh@kernel.org, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, r-sharma3@ti.com, gehariprasath@ti.com
Subject: Re: [PATCH v8 13/19] dt-bindings: dma: ti: Add K3 BCDMA V2
Message-ID: <20260811-exuberant-cobalt-cow-4d5287@quoll>
References: <20260810151423.1948224-1-s-adivi@ti.com>
 <20260810151423.1948224-14-s-adivi@ti.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810151423.1948224-14-s-adivi@ti.com>

On Mon, Aug 10, 2026 at 08:44:07PM +0530, Sai Sree Kartheek Adivi wrote:
> New binding document for Texas Instruments K3 Block Copy DMA (BCDMA) V2.
> 
> BCDMA V2 is introduced as part of AM62L.
> 
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>

Please explain dropping tag. I could not find a reason for that in cover
letter.

Dropping this from patchwork.

Best regards,
Krzysztof

