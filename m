Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17913E929C;
	Wed, 22 Jul 2026 19:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784750301; cv=none; b=mI+4Sai+eT9ssLQ1f6dgvimRoxi2bbmjr9Q/ZBmG/Zirf01ZhtoOWCE9AaSZARZ4iG7Cy6pjnuptWv0NpGHGbG+JqETL/08FGN8E6fup/z+P0QJV7KMU1oMQeTV1MYzqZmokCPYIz9Lkg9QP3Iz9ToVi0yikVdk9lHWWstiUTTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784750301; c=relaxed/simple;
	bh=QfFYH4AAdSwych5FPp3jqeKOau8LL6554iNSzZitnUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NH+xxF5H+WttwL2eZWaMZeU5lVjtC6TKz/0y5cnnWuDG0FXzIMZNNWToqlz14Z/sh1UrDemr0SpjWtEK3AnwnD/cKD4Xhj+YeZhdftJZ8ji4ttM2/kCt42FAORbPnU3biJ8Oc3FAu+wA68q/KsUwtod5QuRkn5JmnO4cRL2/qvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Boxz9m0G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Boxz9m0G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF5941F000E9;
	Wed, 22 Jul 2026 19:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784750299;
	bh=6+BCgcWVmw4IKJaARI9PYsXzFLvb9NP67S2Wo89q6kw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Boxz9m0GxZagK4srmzGUOuzUKoOtfl0u2azMfuGH18WU3/lIK+jKVcB9CTbY0PTHD
	 BDO2Nkz7IKigPNih+0XHBOrg974WJFw4qHGL8NkQbiaUytaXE2EAyuXXDnJTDTmXSy
	 1ORAHiBjg7VsULBvs8B56VKE7AeLFlUjAoDDIwmJeHa0Qt5BzVqurRafPW3hqhMpdJ
	 m6WkqWZu/GqzFH6WXAlOkOIhn5AMrVUSEjBOLqFK8fh5XDWILSf3TR1a1KcIMaHgfS
	 QKNK44axe5zd1/YwvYfK+L8HKGmHLf/BFRD1j4YrzomYxQ8u+mTqZlxmYBD6R8PxO3
	 BbFv9tDYkM2jw==
Date: Wed, 22 Jul 2026 13:58:17 -0600
From: Tycho Andersen <tycho@kernel.org>
To: nathan.lynch@amd.com
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Wei Huang <wei.huang2@amd.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] dmaengine: dmatest: Optionally make test errors fatal
Message-ID: <amEgXsrfskK1PHOg@tycho.pizza>
References: <20260722-dmatest-fixes-and-fatal-errors-v1-0-8287709987ea@amd.com>
 <20260722-dmatest-fixes-and-fatal-errors-v1-4-8287709987ea@amd.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722-dmatest-fixes-and-fatal-errors-v1-4-8287709987ea@amd.com>

On Wed, Jul 22, 2026 at 10:47:49AM -0500, Nathan Lynch via B4 Relay wrote:
> From: Nathan Lynch <nathan.lynch@amd.com>
> 
> For automated testing it is useful to have dmatest halt the machine when
> errors occur rather than logging them and continuing, so that the system
> state at the point of failure can be captured instead of allowing the run
> to carry on.
> 
> Add a 'fatal_errors' module parameter, defaulting to 0. When set to a
> non-zero value N, panic the kernel once N test errors have accumulated in
> a run; the count is reset at the start of each run. The panic is triggered
> after the existing result() line is logged, so the specific error (data
> mismatch, mapping/prep/submit error, timeout, or bad completion status) is
> recorded before the crash.
> 
> Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
> Signed-off-by: Nathan Lynch <nathan.lynch@amd.com>

Reviewed-by: Tycho Andersen (AMD) <tycho@kernel.org>

but,

> @@ -583,7 +611,7 @@ static int dmatest_func(void *data)
>  	struct dma_device	*dev;
>  	struct device		*dma_dev;
>  	unsigned int		error_count;
> -	unsigned int		failed_tests = 0;
> +	unsigned int		failed_tests = 0;	/* for this thread */
>  	unsigned int		total_tests = 0;
>  	dma_cookie_t		cookie;
>  	enum dma_status		status;

I would probably drop this hunk if you re-spin. It's on the thread's
stack, so it seems like an "obvious" comment.

Tycho
