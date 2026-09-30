import './editor.scss';
import './style.scss';

const { registerBlockType } = wp.blocks;
const { TextControl, Button } = wp.components;
const { MediaUpload, MediaUploadCheck } = wp.blockEditor;
const { useBlockProps } = wp.blockEditor;

registerBlockType('create-block/custom-yt-block', {
    edit: ({ attributes, setAttributes }) => {
        const { videoUrl, coverImageUrl } = attributes;

        const onSelectImage = (media) => {
            setAttributes({ coverImageUrl: media.url });
        };

        return (
            <div { ...useBlockProps({ className: 'cyb-editor-container' }) }>
                <TextControl
                    label="Link do YouTube"
                    value={ videoUrl }
                    onChange={ (val) => setAttributes({ videoUrl: val }) }
                    placeholder="https://www.youtube.com/watch?v=..."
                />
                <MediaUploadCheck>
                    <MediaUpload
                        onSelect={ onSelectImage }
                        allowedTypes={ ['image'] }
                        value={ coverImageUrl }
                        render={ ({ open }) => (
                            <Button isPrimary onClick={ open }>
                                { !coverImageUrl ? 'Wgraj okładkę' : 'Zmień okładkę' }
                            </Button>
                        ) }
                    />
                </MediaUploadCheck>
                { coverImageUrl && <img src={ coverImageUrl } style={{ marginTop: '10px', maxWidth: '200px', display: 'block' }} /> }
            </div>
        );
    },
    save: ({ attributes }) => {
        const { videoUrl, coverImageUrl } = attributes;

        // Wyciąganie ID z linku YT
        const getYoutubeID = (url) => {
            const regExp = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/;
            const match = url.match(regExp);
            return (match && match[2].length === 11) ? match[2] : null;
        };

        const videoId = getYoutubeID(videoUrl);

        return (
            <div className="cyb-wrapper" data-video-id={ videoId }>
                <div className="cyb-cover" style={{ backgroundImage: `url(${coverImageUrl})` }}>
                    <div className="play-button">
                        <i className="fas fa-play"></i>
                    </div>
                </div>
                <div className="cyb-video-container" style={{ display: 'none' }}>
                    { videoId && (
                        <iframe
                            src={ `https://www.youtube.com/embed/${videoId}?enablejsapi=1` }
                            frameBorder="0"
                            allow="autoplay; encrypted-media"
                            allowFullScreen
                        ></iframe>
                    ) }
                </div>
            </div>
        );
    }
});
